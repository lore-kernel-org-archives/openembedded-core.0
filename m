Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB65FEB64DA
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 05:18:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5944.1688102325512449655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 22:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=QKCMWjtU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65456dd8b3=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35U5A2T9026891
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 05:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Cy57U0VNFl1qtS6ZFyic+nXLOamd4pK6sX0mpGqruso=; b=
	QKCMWjtU5xl/AHijeu2QqyAZRqxjgVGAvcNmVqh5YfwPn4Q/mhBKLTgtd/5jE7dY
	1ryejak2Gzkm2c+CNkD/8Fdjd7IXmX/BOj2FT0dc3XJslnEHS4JIWMNpiEyvLt+Q
	Vm4tr6VBHHq/KrGk4rWxPMxIrjsyYsRxPfXPEsCUdiZasLlfrxtaxNNqont82H9F
	23RhzglPs9oBSgnTjAm9CSftrpb1He7K1ZWDP6/x/yIrftkFU22aO1FnDAPmwrn9
	Z7mqNiFaCxAUbtLcgEuvYlKlN+MgJ+n6i2KRJciND7sOT95wKeXCi3NtsWya6pw6
	jGQrNd3O5oE+4HrPkY5mNQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb5ht2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 05:18:44 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35U5Ihrx007698;
	Fri, 30 Jun 2023 05:18:43 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb5ht1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 05:18:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URT66Gl0190/fFNVyFCyKVlCalMSi1hlGtPyoMOIGbWx1JRJ629CNfaQpfs0UjZAgp2qTdsG6YZDLBECRIwiZTTBiYnTErVsX+7F4a1LYB8kjf/hhfG8+AV5CL/lKAQw317w5aWYoFtpsep6O6RnT42z7UejzB0aP9GqV6VSL8bE42XxvtK84/sRCzRP9QiyLXsX8xlZo/j+WxmbByDqwK47evKFsQWtiPAlnpY1xADEXD+7QYL/CJvMx1qJPKW1GuhApFJ2zPM+MJeWxbmdhlodZZSdM2Wrqrpp9q04cJqE3YG9WFGN3PhdDUm6OqpvgyMqfQmL1JWKaU9/H8BTgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy57U0VNFl1qtS6ZFyic+nXLOamd4pK6sX0mpGqruso=;
 b=egeUj1k4qjD94WPGEmfHI8Drw13Q73NTrVnZem0IF6Ofcs2a2nGwFrFshzQkCve0Gv6hGUM3cpXsCA+HS/4MsScBRW0GD/xAmWUh4QPHOcs02xIzcvC2Jx/6IMF73Qcrz/yDN91MWnWEr97YVwSeTuR+O1Ijtegw7IGxNN9vjX20Htb2upHvuFaNfY50DaTSJi0gHPQBrj6u7j8ViQhWwFgzef9+wIo4Vv+pAwmGcTQpnmXfdWgrE5hFRHV3p0wE1fOpWTYwKYR/acfRm33k/1PCUHO0rX99QwKUkA197Rl+XzCq8KiFgi8PQf3g2bpeCNFbiaS45KHT+1vMxUdlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 05:18:39 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::1725:89dc:a7a3:7472]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::1725:89dc:a7a3:7472%5]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 05:18:39 +0000
Message-ID: <87891f93-d265-f58f-f16b-639641a43d24@windriver.com>
Date: Fri, 30 Jun 2023 13:18:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [mickledore][PATCH 1/2] erofs-utils: update 1.5 -> 1.6
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230627070552.2017915-1-changqing.li@windriver.com>
 <CAOSpxdYytw7y9EJ2BQ9h+HgY5WakQwO-vW10q3c3Fpcf9rZiaQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAOSpxdYytw7y9EJ2BQ9h+HgY5WakQwO-vW10q3c3Fpcf9rZiaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::19) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2548:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa93664-edaa-4ea2-dee7-08db79297610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5gZzNFA/2gBSCcyG0kwz0yKLilSvFxiK/lMEKwXeG2L+KMVozyLSHRoFtoFXUxJ4GplmBVhoMf0FC8MokBO9bvQkeHB5e8lJAD1gLpDPo15hq+Cy4cktjXYSKuiIO8qnx2b77fpuo+0sPImtPbuhnj8OJ2HRr/snT8nhVclFlMHFRe7v2v58Uy5M3/KrH/R5y3wGSrhyMdOyLCTikcpLyQ1K1kReMj7wuutNk9gC/68gJZMmNX1BVc1NJe0aQM/4+GOw9Z6PdLA7KOWD7rsocV93cGR0QW1y+QrbR8eLtHSBpelkGYsszFNdkTwTziZHsaO2OQGKNN0IkahrajSFJYWXZ8S//Yd1XNe1lCxuXJ+lADcS0r4U9Fz9rWI2xNci+Ssy0Upewz2sNCVSYWgBNz/23xPi9O5MbRfZLJQfhQmGXGhS8oKVseF3lYyH05k2MOjV9z8xPK9iKzQAx9htwO4ggdnWYvFb2OXho3lh5hrdffbRGDHqITUEfpwCOA4jAUPvX9nSjQ603eOiqf2JQN0r+6bB+GulinzbaeT75PVsEHB0EoPTjogl/f6hvI1Xf7OQQsmto6P7J7CrGIln3IDqcikIQXUT/BJCeU5+taL/BH+qie+kynDqvxx9HYQuOAJwPhmS6GvnlrnkEOhtONDGezHdZ4rwwRHz8OfNEwzEoGz9d6uTpV6vhglCdICD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(451199021)(83380400001)(110136005)(6666004)(478600001)(6486002)(966005)(66946007)(2906002)(186003)(26005)(30864003)(66476007)(66556008)(6512007)(53546011)(6506007)(316002)(41300700001)(44832011)(38100700002)(5660300002)(8676002)(8936002)(15650500001)(36756003)(4326008)(86362001)(31696002)(2616005)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjRGL0RZQjd6cGZ6VEthNTJ2aWJzWTlvaFhCcGo5cGpraVN3elZUakJNK1pJ?=
 =?utf-8?B?WTF5SWtRb2JtdyszZFY0dGM0cXd1Z1lJdDZSc0NqL0pCSUtIT2tHS0hWbFVP?=
 =?utf-8?B?aDJJbFVYRHNBQkNOazFxRG1iQUZ5MGF6NHVuWXdGb3VOTnBPcE5ibWZuSU5Z?=
 =?utf-8?B?YzQ0TENWQ2hPblJ3cVBjb2hSYUFiK0ZCL0U4eUUrUEdPZGNwaUF0Z1lsWnJ6?=
 =?utf-8?B?OTVwbkdRaFE2UXJ3MURSZG1EOFdXWXIvTE8yUHc5UXRoOFlrdGFxYW1sRFR4?=
 =?utf-8?B?QU11NURHck5xOXZ0Qk9ybTRiMndhejhIZnp4eFNOSjZWL09idmhjWGx6TmJo?=
 =?utf-8?B?U1ZSeXo4Mkl4eTQ3WXBNOFlCeHlDUW1kS0xML0lRVjRGSnFQSmNndnJtV1Qy?=
 =?utf-8?B?LytGbWRoOFZlMFJXelNYeVBNdmQxUGRudGViNWFwVWREdWk4ZC9ZU20vUFFS?=
 =?utf-8?B?T3FnTlBUUXA4Mm5raUlZUFl0REdpbzVUOUljNG1yM0QvL3ZZTVVaQnBQc252?=
 =?utf-8?B?ZjFXV1F6eHpVUFlOKzhuZkxvUnU3SzlhTEdaZ3cxcURFTWJMNkR1cys3OTZ3?=
 =?utf-8?B?TzRtNjl3UnlwVGJQRkZuZzhFenEvZVhmWlU1ZWtTaWRpSk5SblQ0eDBQRVh0?=
 =?utf-8?B?K3VmU0k1Z3dxeDdZNUhucEwyOU43YW5BR1F4WTc1OEhRb0hUY2lhRlFjeDd0?=
 =?utf-8?B?bXZ5NjYxNmlvUXNVNXAweTIzd1NBVmVCWitSeXF0UVlvSnVNQTUxMVFvTGdH?=
 =?utf-8?B?YkhheTA1Y01jMDNoSHJrdkFNTlROM0ZvQ2IvcU01UWxBWlBvcEhoN2JpdnZk?=
 =?utf-8?B?K2FIWHU3SDlHd3BLN2k1SjFQQnZuTU9IenpBZ3Uramcyc2ZLQitMaFpBMklj?=
 =?utf-8?B?eHdQNTdQOUU0YVJZYmdCaHBwdDJnS1BTUGkrb055VGZKVDB2ZlNueko5dUNM?=
 =?utf-8?B?alU4OGt0TkVLUVRBWFpRRWxJdkIzT0VmK2RCYWdvNGZ3bTlQdENNS09pWDB1?=
 =?utf-8?B?WGg2SlY3cVNTdUpvb0ZsWjJ2VWJBbkdicVI0ZEI3MGVqTnV4SkF0VlRLVGNY?=
 =?utf-8?B?SG1SejA1QUY3OGswZmxaYXdmOTV0SDg0SXBGbk4zR1RUWXdFdjRZVURPM3RL?=
 =?utf-8?B?ek1FZVRpckJsQnZuRUMzZkU1aytRWkxSYTBqdHdLeUNndUc5Y21BdW1ERjdG?=
 =?utf-8?B?Q3VzZUFqQmFkOEN6MEVRakNhOG9qZlJyMFgxU2lLOFRzTUUyQkduYXdEL211?=
 =?utf-8?B?T0pLSS9iZzBlR1MzWVgxZ1EwaFFjSGRDanVLcVZJSmZPQld3RENpdW1ZSTdH?=
 =?utf-8?B?N3NjSlpXdVRFZ3cvaitlMUxFSyt3dFc4UjdJV3IvRXpUL3hwTzE0U0dlNGU3?=
 =?utf-8?B?N081cUtic01MNkpKeHNyV2FVcWFGN1dUSllBYlh4TDhoRmEzWWlDK2tYMlZG?=
 =?utf-8?B?U20vejN1WlJjSndFOVFneHQ1N21Eb0JtUEtreGhyU0xtRHpUUTJZM09kMGdH?=
 =?utf-8?B?NlVUVUJlK0RYUUtlaDlTOEN6ZmoxY3orOVRjT3JFZG9TckhYSEVkbHpCSmx5?=
 =?utf-8?B?VWNyNWF5SzVVY09JRFJjdTYraEZ3dDVaMEFwa0I3bWhpTG4xOGdFVGY1MDBh?=
 =?utf-8?B?T1J5dkU1RXJMRUN4NERvT1QyRjE1M1hLWEc3cHhyOGRkZEt1eW9xSzJPZnVU?=
 =?utf-8?B?NmJxTmtBQnJMVFhhT3h0RTQ2YU53QmdLVjVuc1VDNjFqZ2JYaVR2ZVBDK3JO?=
 =?utf-8?B?dUR0QVkwZFNwbVV0dG04bUZWV1lmOEpLVU9mcFlYZU5KcUsrb1ovTjMvWjB4?=
 =?utf-8?B?ZmdXdHpQSGpRUUYrM0dGeGo4QlB3TWNmd29nZVVGcjBObHR0QkV2RXNGNnZT?=
 =?utf-8?B?OERSUHYxNVg5N3lsNmVoeXRpUlcrbkoxWWgyRlNveTdNb3FqUmlxY1pydyt3?=
 =?utf-8?B?OHJxL2p6aEVmR2YzeU95NGNrTDRya01hTXBVSHJ5RmxTUzRBakhvMEpsNkdW?=
 =?utf-8?B?SnFOQTB0ek5pSmdDOHpyMC9BZmpxZmhvMWh1STk1WU9wRVh3dTRuMkI5NUdp?=
 =?utf-8?B?c3Y3bHB0S3lQT0Exbk1CSUNpUFc0bUFXWEJnVFFPQ01DWURUdWt2MHhRb3VN?=
 =?utf-8?B?eTJ2cEdwVktrUVYrV1lPdnFhcTZuZjRsdnRXcnVtNG5oRkd3MHFrSXpRTmhv?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa93664-edaa-4ea2-dee7-08db79297610
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 05:18:38.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vj0WSkoyOKM+3FU8NKwyxI0G6EXk6WLl64IUFlp4OKhR1DFZoAwylnK4936K0UWP0TOGMa3ebkIYYYiBbsRQ4z9ObboJpsrcC97v9ojBIZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
X-Proofpoint-ORIG-GUID: Y6TsXh-R-JBh01mFd_btHZv2ATkCS06Z
X-Proofpoint-GUID: odIAtAP2bDoUnUsnLx3TOlDxrFGUycN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_02,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306300045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35U5A2T9026891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 05:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183682


On 6/28/23 22:24, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Sorry, I can only take bug/security fix version bumps .  This update
> includes new features:
>
> erofs-utils 1.6
> * This release includes the following updates:
> - support fragments by using `-Efragments` (Yue Hu);
> - support compressed data deduplication by using `-Ededupe` (Ziyang Zha=
ng);
> - (erofsfuse) support extended attributes (Huang Jianan);
> - (mkfs.erofs) support multiple algorithms in a single image (Gao Xiang=
);
> - (mkfs.erofs) support chunk-based sparse files (Gao Xiang);
> - (mkfs.erofs) add volume-label setting support (Naoto Yamaguchi);
> - (mkfs.erofs) add uid/gid offsetting support (Naoto Yamaguchi);
> - (mkfs.erofs) pack files entirely by using `-Eall-fragments` (Gao Xian=
g);
> - various bugfixes and cleanups;
>
> I assume this also means that I can't take the second patch in the
> series (the CVE backports)

yes.=C2=A0 the second patch cannot apply on 1.5.=C2=A0 We need a V2 to fi=
x the CVEs.

Thanks

Changqing

>   If this isn't the case, please submit a v2
> of the CVE patch.
>
> Thanks!
>
> Steve
>
> On Mon, Jun 26, 2023 at 9:05=E2=80=AFPM Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> Drop patches merged upstream.
>>
>> --enable-largefile is no longer necessary, as compiler options are bei=
ng passed in explicitly.
>>
>> (From OE-Core rev: 39d38b278cba7b46fd9b367e6f8c989327899e6f)
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   .../0001-configure-use-AC_SYS_LARGEFILE.patch |  43 -------
>>   ...eplace-l-stat64-by-equivalent-l-stat.patch | 109 ----------------=
--
>>   ...-Make-LFS-mandatory-for-all-usecases.patch |  41 -------
>>   ...{erofs-utils_1.5.bb =3D> erofs-utils_1.6.bb} |  10 +-
>>   4 files changed, 3 insertions(+), 200 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/000=
1-configure-use-AC_SYS_LARGEFILE.patch
>>   delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/000=
2-erofs-replace-l-stat64-by-equivalent-l-stat.patch
>>   delete mode 100644 meta/recipes-devtools/erofs-utils/erofs-utils/000=
3-internal.h-Make-LFS-mandatory-for-all-usecases.patch
>>   rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.5.bb =3D> er=
ofs-utils_1.6.bb} (62%)
>>
>> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-config=
ure-use-AC_SYS_LARGEFILE.patch b/meta/recipes-devtools/erofs-utils/erofs-=
utils/0001-configure-use-AC_SYS_LARGEFILE.patch
>> deleted file mode 100644
>> index 75c91f51a7..0000000000
>> --- a/meta/recipes-devtools/erofs-utils/erofs-utils/0001-configure-use=
-AC_SYS_LARGEFILE.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From fef3b16dba2c5f6ad88951b80cdfbedd423e80a0 Mon Sep 17 00:00:00 200=
1
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 7 Dec 2022 20:16:52 -0800
>> -Subject: [PATCH v3 1/3] configure: use AC_SYS_LARGEFILE
>> -
>> -The autoconf macro AC_SYS_LARGEFILE defines _FILE_OFFSET_BITS=3D64
>> -where necessary to ensure that off_t and all interfaces using off_t
>> -are 64bit, even on 32bit systems.
>> -
>> -Pass -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D66 via CFLAGS
>> -
>> -Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221=
215064758.93821-1-raj.khem@gmail.com/T/#t]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - configure.ac | 5 +++++
>> - 1 file changed, 5 insertions(+)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index a736ff0..e8bb003 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -13,6 +13,8 @@ AC_CONFIG_MACRO_DIR([m4])
>> - AC_CONFIG_AUX_DIR(config)
>> - AM_INIT_AUTOMAKE([foreign -Wall])
>> -
>> -+AC_SYS_LARGEFILE
>> -+
>> - # Checks for programs.
>> - AM_PROG_AR
>> - AC_PROG_CC
>> -@@ -319,6 +321,9 @@ if test "x$enable_lzma" =3D "xyes"; then
>> -   CPPFLAGS=3D"${saved_CPPFLAGS}"
>> - fi
>> -
>> -+# Enable 64-bit off_t
>> -+CFLAGS+=3D" -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
>> -+
>> - # Set up needed symbols, conditionals and compiler/linker flags
>> - AM_CONDITIONAL([ENABLE_LZ4], [test "x${have_lz4}" =3D "xyes"])
>> - AM_CONDITIONAL([ENABLE_LZ4HC], [test "x${have_lz4hc}" =3D "xyes"])
>> ---
>> -2.39.0
>> -
>> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-=
replace-l-stat64-by-equivalent-l-stat.patch b/meta/recipes-devtools/erofs=
-utils/erofs-utils/0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch
>> deleted file mode 100644
>> index d12bebbf87..0000000000
>> --- a/meta/recipes-devtools/erofs-utils/erofs-utils/0002-erofs-replace=
-l-stat64-by-equivalent-l-stat.patch
>> +++ /dev/null
>> @@ -1,109 +0,0 @@
>> -From 856189c324834b838f0e9cfc0d2e05f12518f264 Mon Sep 17 00:00:00 200=
1
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 7 Dec 2022 22:17:35 -0800
>> -Subject: [PATCH v3 2/3] erofs: replace [l]stat64 by equivalent [l]sta=
t
>> -
>> -Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221=
215064758.93821-2-raj.khem@gmail.com/T/#u]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - lib/inode.c | 10 +++++-----
>> - lib/xattr.c |  4 ++--
>> - mkfs/main.c |  4 ++--
>> - 3 files changed, 9 insertions(+), 9 deletions(-)
>> -
>> -diff --git a/lib/inode.c b/lib/inode.c
>> -index f192510..38003fc 100644
>> ---- a/lib/inode.c
>> -+++ b/lib/inode.c
>> -@@ -773,7 +773,7 @@ static u32 erofs_new_encode_dev(dev_t dev)
>> -
>> - #ifdef WITH_ANDROID
>> - int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
>> --                             struct stat64 *st,
>> -+                             struct stat *st,
>> -                              const char *path)
>> - {
>> -       /* filesystem_config does not preserve file type bits */
>> -@@ -818,7 +818,7 @@ int erofs_droid_inode_fsconfig(struct erofs_inode=
 *inode,
>> - }
>> - #else
>> - static int erofs_droid_inode_fsconfig(struct erofs_inode *inode,
>> --                                    struct stat64 *st,
>> -+                                    struct stat *st,
>> -                                     const char *path)
>> - {
>> -       return 0;
>> -@@ -826,7 +826,7 @@ static int erofs_droid_inode_fsconfig(struct erof=
s_inode *inode,
>> - #endif
>> -
>> - static int erofs_fill_inode(struct erofs_inode *inode,
>> --                          struct stat64 *st,
>> -+                          struct stat *st,
>> -                           const char *path)
>> - {
>> -       int err =3D erofs_droid_inode_fsconfig(inode, st, path);
>> -@@ -910,7 +910,7 @@ static struct erofs_inode *erofs_new_inode(void)
>> - /* get the inode from the (source) path */
>> - static struct erofs_inode *erofs_iget_from_path(const char *path, bo=
ol is_src)
>> - {
>> --      struct stat64 st;
>> -+      struct stat st;
>> -       struct erofs_inode *inode;
>> -       int ret;
>> -
>> -@@ -918,7 +918,7 @@ static struct erofs_inode *erofs_iget_from_path(c=
onst char *path, bool is_src)
>> -       if (!is_src)
>> -               return ERR_PTR(-EINVAL);
>> -
>> --      ret =3D lstat64(path, &st);
>> -+      ret =3D lstat(path, &st);
>> -       if (ret)
>> -               return ERR_PTR(-errno);
>> -
>> -diff --git a/lib/xattr.c b/lib/xattr.c
>> -index 71ffe3e..fd0e728 100644
>> ---- a/lib/xattr.c
>> -+++ b/lib/xattr.c
>> -@@ -467,7 +467,7 @@ static int erofs_count_all_xattrs_from_path(const=
 char *path)
>> - {
>> -       int ret;
>> -       DIR *_dir;
>> --      struct stat64 st;
>> -+      struct stat st;
>> -
>> -       _dir =3D opendir(path);
>> -       if (!_dir) {
>> -@@ -502,7 +502,7 @@ static int erofs_count_all_xattrs_from_path(const=
 char *path)
>> -                       goto fail;
>> -               }
>> -
>> --              ret =3D lstat64(buf, &st);
>> -+              ret =3D lstat(buf, &st);
>> -               if (ret) {
>> -                       ret =3D -errno;
>> -                       goto fail;
>> -diff --git a/mkfs/main.c b/mkfs/main.c
>> -index d2c9830..5279805 100644
>> ---- a/mkfs/main.c
>> -+++ b/mkfs/main.c
>> -@@ -581,7 +581,7 @@ int main(int argc, char **argv)
>> -       struct erofs_buffer_head *sb_bh;
>> -       struct erofs_inode *root_inode;
>> -       erofs_nid_t root_nid;
>> --      struct stat64 st;
>> -+      struct stat st;
>> -       erofs_blk_t nblocks;
>> -       struct timeval t;
>> -       char uuid_str[37] =3D "not available";
>> -@@ -609,7 +609,7 @@ int main(int argc, char **argv)
>> -                       return 1;
>> -       }
>> -
>> --      err =3D lstat64(cfg.c_src_path, &st);
>> -+      err =3D lstat(cfg.c_src_path, &st);
>> -       if (err)
>> -               return 1;
>> -       if (!S_ISDIR(st.st_mode)) {
>> ---
>> -2.39.0
>> -
>> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-intern=
al.h-Make-LFS-mandatory-for-all-usecases.patch b/meta/recipes-devtools/er=
ofs-utils/erofs-utils/0003-internal.h-Make-LFS-mandatory-for-all-usecases=
.patch
>> deleted file mode 100644
>> index 97faa5d673..0000000000
>> --- a/meta/recipes-devtools/erofs-utils/erofs-utils/0003-internal.h-Ma=
ke-LFS-mandatory-for-all-usecases.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From 8f8cbc7b773da63bce8226249784ba6824635c9c Mon Sep 17 00:00:00 200=
1
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 7 Dec 2022 20:19:27 -0800
>> -Subject: [PATCH v3 3/3] internal.h: Make LFS mandatory for all usecas=
es
>> -
>> -erosfs depend on the consistent use of a 64bit offset
>> -type, force downstreams to use transparent LFS (_FILE_OFFSET_BITS=3D6=
4),
>> -so that it becomes impossible for them to use 32bit interfaces.
>> -
>> -Upstream-Status: Submitted [https://lore.kernel.org/linux-erofs/20221=
215064758.93821-3-raj.khem@gmail.com/T/#u]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - include/erofs/internal.h | 5 +++++
>> - 1 file changed, 5 insertions(+)
>> -
>> -diff --git a/include/erofs/internal.h b/include/erofs/internal.h
>> -index 6a70f11..d3b2986 100644
>> ---- a/include/erofs/internal.h
>> -+++ b/include/erofs/internal.h
>> -@@ -21,6 +21,7 @@ typedef unsigned short umode_t;
>> -
>> - #include "erofs_fs.h"
>> - #include <fcntl.h>
>> -+#include <sys/types.h> /* for off_t definition */
>> -
>> - #ifndef PATH_MAX
>> - #define PATH_MAX        4096    /* # chars in a path name including =
nul */
>> -@@ -104,6 +105,10 @@ struct erofs_sb_info {
>> -       };
>> - };
>> -
>> -+
>> -+/* make sure that any user of the erofs headers has atleast 64bit of=
f_t type */
>> -+extern int erofs_assert_largefile[sizeof(off_t)-8];
>> -+
>> - /* global sbi */
>> - extern struct erofs_sb_info sbi;
>> -
>> ---
>> -2.39.0
>> -
>> diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/me=
ta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
>> similarity index 62%
>> rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
>> rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
>> index 2b5861882d..43643e07bb 100644
>> --- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
>> +++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.6.bb
>> @@ -5,12 +5,8 @@ SECTION =3D "base"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73001d804ea1e3d84365f6522=
42cca20"
>>   HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/=
erofs-utils.git/tree/README"
>>
>> -SRCREV =3D "a2821a66b42aee5430bccee82c280e38d1e9ab29"
>> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erof=
s-utils.git;branch=3Dmaster;protocol=3Dhttps \
>> -           file://0001-configure-use-AC_SYS_LARGEFILE.patch \
>> -           file://0002-erofs-replace-l-stat64-by-equivalent-l-stat.pa=
tch \
>> -           file://0003-internal.h-Make-LFS-mandatory-for-all-usecases=
.patch \
>> -           "
>> +SRCREV =3D "21710612d35cd952490959bfa6ea9fe87aaa52dd"
>> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erof=
s-utils.git;branch=3Dmaster;protocol=3Dhttps"
>>
>>   UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"
>>
>> @@ -23,7 +19,7 @@ inherit pkgconfig autotools
>>   PACKAGECONFIG ??=3D "lz4"
>>   PACKAGECONFIG[lz4] =3D "--enable-lz4,--disable-lz4,lz4"
>>
>> -EXTRA_OECONF =3D "${PACKAGECONFIG_CONFARGS} --disable-fuse --enable-l=
argefile"
>> +EXTRA_OECONF =3D "${PACKAGECONFIG_CONFARGS} --disable-fuse"
>>
>>   CFLAGS:append:powerpc64le =3D " -D__SANE_USERSPACE_TYPES__"
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#183440): https://lists.openembedded.org/g/openembe=
dded-core/message/183440
>> Mute This Topic: https://lists.openembedded.org/mt/99804978/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

