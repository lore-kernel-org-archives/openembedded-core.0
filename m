Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CB8C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 18:12:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4004.1686075130059025009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 11:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=AwgDb+jG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55213cef27=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3568RdCM017937
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 18:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : cc : in-reply-to :
 mime-version; s=PPS06212021;
 bh=NQeL436r40K+lMOMMTkqB1/5QBIVZUmILajZ+e+5zAA=;
 b=AwgDb+jGwaL5MpuR6GhZ0+nLq+yxqOfWuYDM0J87Ou4QeXVzYxiRjUMD2QqG7rwpETqP
 wZla+ri6tTM/8tY/xaQUMv3wE6HwPPV/azzz3QGFgBqUAZfVGhwdID7h5rYUJnv36lhk
 82rhxBOb0te7ZTQ9Oxa7prEmgk1fsr3Aa42ettW6Wn25sOtOHrMJpBEx491DKPTOVphw
 h/0+f/T1Ep9kQd645WoveqnrhS6SDNg8S5ObMvqpz+7yn0HJfMLXvWvcBivMlgZdql2H
 6qv4fonyRl2ivE1CftgGhPbaCp4N6KYoN2TF+LBCIGWmNYBG4ibrqAyYGNGfcDSQTWkx uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jrs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 18:12:09 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356I8cf0006401
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jun 2023 18:12:08 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8jrs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 18:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcic2ZYltRiWShzvsVbOhWJu7upQaVEEOpoiDkbEkxSag3ejRuRI/WkJq/E+X9uaviIXCm6/0fVQeGPdzMNzBONGOdwkMujf+cUU5mdv/7u938eVw9DRFJ+EniRztf7bvNVHsc9nIO0kC4HyPxfWBfGbdllE/AlVeQ3576bPgbHbGzVq77toObyi8hvv8G1kDSQnU+6Ps7dD7+LxE+RYBy7Ql2X4qzKFZjEZSVjwQV9oOMN7j/U2LKk0rHJYjtwQ1KEK2gdBTM3YlPxaTjLsi9oeCGGSWgxp8IRGK6O3XuZ5I0ZtrW3Ls9OuMPTNvfCZcBGUYBoh4+zng6pgSCEvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQeL436r40K+lMOMMTkqB1/5QBIVZUmILajZ+e+5zAA=;
 b=aj7e8O/BZVofKFjMRhwS4HSdFuZumS4gvw7H9iAQ0g+LM5/sUvzq9AUtOTZLKPmGGgKBaZ8h+SmRi3qTo00rpH1rpMCagbrzNSGb0itSMk0SntcCwwUOgyTtam5Rjzs9Fi6VmSedhL0bii7UYKVrUAj5LNiYCadEJ4JK2IJv77LJ3/D/NAXTYdJkvJxXG7FCU9yW7nGJOeJGshjE09D8+WTqv8xLUEqLDQWvrbWdk9VjAYHIhJoBeKVGlYnRbKOQX8WaBd0lrE8AJfWy+RGUhMI4f6aHpP6+gZL38xJ0vPHcy6p+HX1kqVUWO7cbWlRwb6FYSKChildA26BnIBLIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 18:12:06 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::63:b999:7c4e:c2a8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::63:b999:7c4e:c2a8%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 18:12:05 +0000
Content-Type: multipart/alternative;
 boundary="------------vZ9tkx5lVq2t7jLfPCjr6U7f"
Message-ID: <7daf0202-d27a-32be-8b46-3f4763720ce4@windriver.com>
Date: Tue, 6 Jun 2023 14:12:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] perl: fix CVE-2023-31484
Content-Language: en-CA
To: soumya.sambu@windriver.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20230605174616.2559077-1-soumya.sambu@windriver.com>
 <a29c16f23d36d0a4c5b714285329c74c03e89200.camel@linuxfoundation.org>
 <BYAPR11MB339703E6629D812AD19D49C28152A@BYAPR11MB3397.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
In-Reply-To: <BYAPR11MB339703E6629D812AD19D49C28152A@BYAPR11MB3397.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::41) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: af55a643-5e41-42ab-949a-08db66b98912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	arQYLHpzFZGsru8N1UZlk4ULG8KoEuriq1mHvgEU4mk1nCEvmowUctOhmb7MrHhL2Mx7ovdin0sLj3IkES7QLpGI6K9L3/THrmyDvoOOEkfM3XSB8JTZNgdJE1m50KqH8AITtGnMtORERr9nv4/1xtS5bH321uKGUbRMY/VLNrYmj6wQfM4U3Ji1SHNYiUbSJ63jhTCkcKlBizwl/7YcEambsu2L4R58/hcz4v0eRFCdaVucdsDpSwxYQOiBMmuXjNhxJA6ucpQKPxcv9kcGqxJm0S8PIPY/s84uXBglqU55hvvdQ0b65UVzgE2Gczkot3DlPw2LvxVCcD3LH6SoKQFsXqZD/HBktEjJZcd9yVq73eaDNarZYYbpYl3g10Mx0cWW1AjZEd3A7ETkI/F2neYttVjG+VGyaFoFVK1tWPCHoXNw3TOkZAz0gSO+Ow6fOyHAax8xC2n28Ra9v8yzE2mu2RgC1IScWd5xcHr0qLtI6ZVeMn+Sy14ja+FAFxoQZexeGfVOXD67ocouoI3BWonB+zwZoROBvJRvEJ2w3Ft8PcG95Pz2p7cjIa3TDbNCmfYMCOtb+/G61nAH98KlX1qGFOK6uME/lWw+HhdpjD3BfdBp/Jqf+2TXa0e0SZCfdEwq2CbH46tFK1w90at4tw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(451199021)(66556008)(8936002)(66476007)(4326008)(66946007)(8676002)(316002)(107886003)(110136005)(19627405001)(41300700001)(2906002)(478600001)(31686004)(5660300002)(66899021)(33964004)(6486002)(966005)(6512007)(6506007)(53546011)(26005)(186003)(83380400001)(6666004)(166002)(31696002)(86362001)(36756003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Umh2elpNN0c0eVBUSVduTGw0TUtqUVduZlRaV0JoR1lobjZRVENCMXJ5WDFo?=
 =?utf-8?B?Q2ZSQjhOS2piWWFxK3JQSWNKZjZmZWk5QllpK2xRY3Z3aUxTOGMvWUNrYmNE?=
 =?utf-8?B?a0FXS3RQU2xBalkxWVV1cXF3VG5YdXgvYk1DUGtuTjcwekRLbkhKbDFZeFZN?=
 =?utf-8?B?M3RhVFozS2J2TmdRRmF2QktIS2VWK3NqbTFWYVVUTzVOU25NRTlNaTlMQ0d6?=
 =?utf-8?B?L1VQdjRNYkhFc2FLeDlrWFpNZVdXeWhNeldOQXgwMXJZajlRNmlIRHV4Z0Jy?=
 =?utf-8?B?a05lb0Q1Z0hUNjBIR0U2cDFReXpvd0lTdGlwajkvS2U4VU9DeEFCMkJvSm5L?=
 =?utf-8?B?VVdTNk5PalVjbHJoZHpwZEVWR1lPbStISTFDOW05Z3BsU1AveSt4akp6V29z?=
 =?utf-8?B?MjAzT01EUisreHZHdFR3Y3ZSNEZlSEpIdjB6cmhSVGxqTWh2Z0oxbDZKMmtR?=
 =?utf-8?B?clZORVpQSmJxdXdOL3BBRTF4L1FORlVISnRqT2tiVGlHYTVXeUd0TlRmOW5y?=
 =?utf-8?B?TUdUalQySk5XSDlIU081NkhlOUFCdGQyWFVBVy8zMkVBWktnWkt6KzZmbWZY?=
 =?utf-8?B?NXdBUzZMeTdMYlJVYUtjVTJZSVRzYWhxcnAzcyt2TlM3VjZGWkJmNmFkVEo1?=
 =?utf-8?B?eVBGMlJLL2VkdTR5ellId3YzcmJPVi9PU3Fib1JxM1VSOUxodzl0Uk1pMGp3?=
 =?utf-8?B?N0hkaFdSTkM4SXhsbUxmaVFUMEQ3VjJPUlNlMGd5YVN1dWdtc2ljMXVYREhu?=
 =?utf-8?B?VFZQQTV1VEt1SlFVdU1qVG1BNTVHRXFLOVcydFFIemNXSEZtdUFRQzlkQlpj?=
 =?utf-8?B?OGxSWTl6RW1lWW5qOFBpVXNXQmxya2RrVitYaFIxakYvaVltYkRwYktxTG1m?=
 =?utf-8?B?M25vSzhKYVJXNHNnM3RIRkc1SkR0MDdJdHVxa1ZYOWdZTzJtUjEwWHpNSWRo?=
 =?utf-8?B?NkZ2Q1pDTitqeHhyTGVBYmFvUkl6RTlyV0ZYbTZYQTdNa2lBbWFjQ0E0TmIw?=
 =?utf-8?B?RHJVeW5lTmFrL2t6a0U3cFAwUWl0aU1jbHY1Z2IxTTNXWWNOcHRSRzdZZG95?=
 =?utf-8?B?WXpxcTRZT1g4bjZyUm53VXd6OXQzVmF4Rm1wVXJCUHhGR2dxTzluc20vcVgw?=
 =?utf-8?B?aGNXdlFoaCtyTUFSOHB4djROc0NLdE9xZTErWXdWOWtxZDJnWkgzR0J4TjMy?=
 =?utf-8?B?enRQdzRXZTVuMnp1OURlZ0E3NTJCNkFwdjJTMTBsK0RLQnFiVkt1aW92SzNj?=
 =?utf-8?B?dkU0VDREQjB3dU5xY1lydWVhRTR0UXY2dEt2WjJ6VUYvVnhXY1g4aVNkaDNm?=
 =?utf-8?B?ZXNvSWlHSk1RQ1l6SjVKUi9QaEdtQktGQXk5UzZZNFl4Qk01TzJESVFHVkV1?=
 =?utf-8?B?QkJTaGdVYTBVSEdkUHFUYzlHeU9Kc00vNytVVnZLNUZudDJOQnFUdlcwTzFK?=
 =?utf-8?B?N01USXBycThEclVnNkxra2hicXlNaVNNendySU9jbzdiTUVHU3l0TDdwSGha?=
 =?utf-8?B?MTA4MjdPSG1JZklpOTdwUkp1QWovY0ltVlNUVFUvR25YMnlVb1lXTUplK1Zp?=
 =?utf-8?B?MUE2VTV6VDRuUTIwb0ZJbnoybUF0aEFKeExsT3NLUFFNSjNLcHpmQk1FMkg2?=
 =?utf-8?B?ckdrZEZWTkVXdEFsTTdqKy8rTFpHS2VYZFVmdy96eFVsODFkaEpQOVFoZnFU?=
 =?utf-8?B?a3pMNnhvVlBYWVVOVmFpWUtzL3NINVFrNVhHbVRodTdrVlBXY0hhNWZpYzc0?=
 =?utf-8?B?b01TdkhER0JMSEprbGczaXd0VzJWdkYwYzZvTUc3UGNSN0pMOUVPekY4dzNt?=
 =?utf-8?B?Nkp6NFlCTHNpWVV0dDRRWnVaM0xzOUxqeENMSjdTMnZyTFlNNEc3dVJOeUlr?=
 =?utf-8?B?RmRMMjd0UUdES2tzQVZucGZPOCthaVNDVHM4OGdoWks0MTM0TmRDRDFGVVhH?=
 =?utf-8?B?V3A3bVI2YnNwKzJ1Y05mOURodm5JeXgrWmo3MW1hdTBpZE5mUVo2ekVpT05t?=
 =?utf-8?B?NnZmYzhCMkFiQnhPSFhOUDBFaGpTbXZrUzdCRndoVWFoVFRIZTdCL1dKOGg0?=
 =?utf-8?B?OGZJQVV5aUNGNXZCRUtuMTIyVWxMak5lOHl2Yjl6UzVjcWdwMWl1YTRPNXUz?=
 =?utf-8?B?SWhFcVZEaU14Q0Q2T1V1TzYxczB6S1dicWlNMmFNWlh4OWVmUFdaaHZ2QUxN?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af55a643-5e41-42ab-949a-08db66b98912
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 18:12:05.8906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzKhI8OLns28AW6hiDk8TTxgg4ZRhuPRirvApU9+Bt9E/xFTAix9OJDOK/hMFjzlPyWOIsMvtZoyd5LLTro4aOxmEeom8/uwrkUToB/aUhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
X-Proofpoint-ORIG-GUID: kotT3LLuPiiDshj2aoZW0gk1D1jxQ8zI
X-Proofpoint-GUID: lcUM57nuJxDhGdwOilPwO4Yc4yJpetq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_13,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=858
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 18:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182448

--------------vZ9tkx5lVq2t7jLfPCjr6U7f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3568RdCM017937

On 2023-06-06 07:38, Soumya via lists.openembedded.org wrote:
> This is for kirkstone branch. Attached is the updated patch.
>

Soumya,


We don't usually take patches as attachments since we
like to see the changes in email easily for review so

unless Steve makes an exception this time, please
resend following the workflow documented here:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded


See and read the section mentioning:

 =C2=A0=C2=A0 git send-email=C2=A0 ... --subject-prefix=3D"<BRANCH_NAME>]=
[PATCH"


and the rest of the document and links therein.


../Randy





>
> Regards,
> Soumya
>
> -----------------------------------------------------------------------=
-
> *From:* Richard Purdie <richard.purdie@linuxfoundation.org>
> *Sent:* Tuesday, June 6, 2023 4:35 PM
> *To:* Sambu, Soumya <Soumya.Sambu@windriver.com>;=20
> openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] perl: fix CVE-2023-31484
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On Mon, 2023-06-05 at 17:46 +0000, Soumya via lists.openembedded.org
> wrote:
> > CPAN.pm before 2.35 does not verify TLS certificates when downloading
> > distributions over HTTPS.
> >
> > Signed-off-by: Soumya <soumya.sambu@windriver.com>
> > ---
> >=C2=A0 .../perl/files/CVE-2023-31484.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 +++++++++++++++++++
> >=C2=A0 meta/recipes-devtools/perl/perl_5.34.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> >=C2=A0 2 files changed, 30 insertions(+)
> >=C2=A0 create mode 100644=20
> meta/recipes-devtools/perl/files/CVE-2023-31484.patch
>
> Which release is this patch against?
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182426):https://lists.openembedded.org/g/openembedd=
ed-core/message/182426
> Mute This Topic:https://lists.openembedded.org/mt/99345985/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------vZ9tkx5lVq2t7jLfPCjr6U7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-06-06 07:38, Soumya via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:BYAPR11MB339703E6629D812AD19D49C28152A@BYAPR11MB3397.namprd11.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);" class="elementToProof">
        This is for kirkstone branch. Attached is the updated patch.<br>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Soumya,</p>
    <p><br>
    </p>
    <p>We don't usually take patches as attachments since we<br>
      like to see the changes in email easily for review so</p>
    unless Steve makes an exception this time, please <br>
    resend following the workflow documented here:<br>
    <br>
    <p>&nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a></p>
    <p><br>
    </p>
    <p>See and read the section mentioning:<br>
      &nbsp; <br>
    </p>
    <p>&nbsp;&nbsp; git send-email&nbsp; ...&nbsp;
      --subject-prefix=&quot;&lt;BRANCH_NAME&gt;][PATCH&quot;</p>
    <p><br>
    </p>
    <p>and the rest of the document and links therein.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <pre>
</pre>
    <p></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:BYAPR11MB339703E6629D812AD19D49C28152A@BYAPR11MB3397.namprd11.prod.outlook.com">
      <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
        font-size:12pt; color:rgb(0,0,0)" class="elementToProof">
        <br>
        Regards,<br>
        Soumya<br>
        <br>
      </div>
      <hr tabindex="-1" style="display:inline-block; width:98%">
      <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
          Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
          <b>Sent:</b> Tuesday, June 6, 2023 4:35 PM<br>
          <b>To:</b> Sambu, Soumya <a class="moz-txt-link-rfc2396E" href="mailto:Soumya.Sambu@windriver.com">&lt;Soumya.Sambu@windriver.com&gt;</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
          <b>Subject:</b> Re: [OE-core] [PATCH] perl: fix CVE-2023-31484</font>
        <div>&nbsp;</div>
      </div>
      <div class="BodyFragment"><font size="2"><span style="font-size:11pt">
            <div class="PlainText">CAUTION: This email comes from a non
              Wind River email account!<br>
              Do not click links or open attachments unless you
              recognize the sender and know the content is safe.<br>
              <br>
              On Mon, 2023-06-05 at 17:46 +0000, Soumya via
              lists.openembedded.org<br>
              wrote:<br>
              &gt; CPAN.pm before 2.35 does not verify TLS certificates
              when downloading<br>
              &gt; distributions over HTTPS.<br>
              &gt;<br>
              &gt; Signed-off-by: Soumya
              <a class="moz-txt-link-rfc2396E" href="mailto:soumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a><br>
              &gt; ---<br>
              &gt;&nbsp; .../perl/files/CVE-2023-31484.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 29
              +++++++++++++++++++<br>
              &gt;&nbsp; meta/recipes-devtools/perl/perl_5.34.1.bb&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
              &gt;&nbsp; 2 files changed, 30 insertions(+)<br>
              &gt;&nbsp; create mode 100644
              meta/recipes-devtools/perl/files/CVE-2023-31484.patch<br>
              <br>
              Which release is this patch against?<br>
              <br>
              Cheers,<br>
              <br>
              Richard<br>
            </div>
          </span></font></div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#182426): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/182426">https://lists.openembedded.org/g/openembedded-core/message/182426</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/99345985/3616765">https://lists.openembedded.org/mt/99345985/3616765</a>
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

--------------vZ9tkx5lVq2t7jLfPCjr6U7f--

