Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FBC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 08:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16354.1707295482255049427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 00:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PfR3MajF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2767a3df65=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4175A2Yt014007
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Feb 2024 00:44:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=KsgGXhlWRvk+R7Pvxlq2al8vzwM0NqZUVnmGV5zbSzo=; b=
	PfR3MajFDHG+nDKOJ1s+sUxa/l9fibM5+TvKtyUhjXh6Jf9Kr8Rf57qxaaGQLsGB
	8WLLLcFotA/83xiOezaepbCsuEw1iCo0RT7Le9NVAPERNJI5f5uteRQc7KRr0TxO
	0jpPoU0yu8uZxhrDu15i7yI49TSjWmHAKDJYt45IF2arVezRauw4JCLtiZMHIrd3
	aJo5NMCqLMKddFQ3sx8t2f9GulKq7Js0pmuYUHzOfSV98IzpEwAMrfxJCpq6Y5lZ
	6fmjqZoyciIiceI4cm93fDtRLKZofzyFC0R24kcxM+i+WBwCYf6nvWsR+56uzWrA
	T5kacyB3B0QXen5Mxyi4lg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3umqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 00:44:41 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4178ifEY008250;
	Wed, 7 Feb 2024 00:44:41 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3umqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 00:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CREYleSd60bqk28l+rJT2dAsNQrwDjwR3c7gTnRzp0hdmLpC3Fjmk6KTCO/2g27f0guzEvNX7/tBa1nb80zlJsD4NhgI+814J50vXYpXQh36BhhogVh+MfTldfnXfMh7Hc3CC1xnWfDzjgzkluFamwKy753gxJ4dxpmuX6SebgdEH/g8yYefWpiLd5KNoxacSVWECmkqr7ZCmcdePwMip5r41U8hM37d5NH40INJWwE5AlbpCcRMnyeVX39AVEULjLx7OD7/un2eM9MsNwcEJXCA19BePzWY3iAf7z30hx6cjhuayfo0NJIf7i82XwO3pvfCj5gpGRfpocV7zClgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsgGXhlWRvk+R7Pvxlq2al8vzwM0NqZUVnmGV5zbSzo=;
 b=LgGiHBHW4dXMdVnqquumeUwlVqQpd3jRW4GjmYBML5oQF12aYqRzoV/dCpJ+UA6FEHTq7TLsM9lAM9VvWjCuZHXqT75KTA49sPg+ZOpZ9aOG48r4yerlsxGstz+tfWL7w4HS5e4WVEYcF1gIjN4wG5WBAZxT/Kpz5NTCBhwj46pg5j0kBbEynIpo5EyRmI0migJ+W21wjNmDR6OuX65NGp7TEuq7wASIu7Q/5SZBI61UTIrFL3vXz8C5Q8DJKpQ5m4gNp/GJ2M0m53f7Tw6iAQ4ot2Z+JjHu/fApQmnH6OGDb5EUaE1w0a9thOxEGiVrHtnngpykNJN0kdhHN3JNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 08:44:38 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8b8e:f9b9:7a84:375e]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8b8e:f9b9:7a84:375e%4]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 08:44:37 +0000
Message-ID: <af279063-ebc6-4821-b389-22f99560d5ee@windriver.com>
Date: Wed, 7 Feb 2024 16:44:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4] rxvt-unicode: set correct outdir for tic
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231222083848.241593-1-changqing.li@windriver.com>
 <A718DD2B-DD41-42C0-81FF-E4002E8BF8B6@arm.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <A718DD2B-DD41-42C0-81FF-E4002E8BF8B6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c49431a-da9c-4ec2-c2d4-08dc27b9043c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P7gpbXP+h639eBMtvsN+Rs6DEwyKI+gtqTmvGLoFovoXiZA9WxImr3/nkFBp6WOrw01ylvDgQbkT0acVK7UTFGrRs33+DLlxi6L5SEo339T9zv0aPDtzOe9x+qtINDd3svdDO0e85G23Ld2selNEDlzgP0dFldmQ5EvHdLML7CNmJ8lic+PDENf6Dm1+EJiZGElgOsKa+nmMNw5zwO32G74CPWmtYowatz+wj0fvnHri6cuqUmgsCqZ6Ubttw0B1rXQjBOIoolCzp9xb8sr2FM7k4jeNk0IlRBkLwe3YveNvgNV0h9RbMiEE+CCWfk46P4UPLTDFpDgfhlg8aV8HyiKr+H+jxcv6q1SxEr8FXofFwprcbAoOEzkM4iO12bt88XFvxHdGj6hdZ4TfOrP2v65apSG5LMFNd+jLEgUfzfPTFlvD8cYaD3F1hJvDLha+CLMll2LdV3ad2Y7qYiPQgWoBrluwZET2kAIRaEtPnYZIAMC/qdJx4+jpQQi67fm4+ZQ2Co69CHj5kLE3BjP0X2sM5HL5e5prAt+eVSSKhX4p296riFemSXA1Ac5SmOU6899NVxVltoOhktvUFe+gQ1o8Epv5gBawOutsErSVI4IwAGhOAk3SzX6le0NIAzw0+pKvX99OUUMTpUuMDY8Xd8tx9uX/5/p6t8o/etxoa1U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(396003)(136003)(366004)(346002)(230922051799003)(230273577357003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(66556008)(66476007)(66946007)(66899024)(316002)(110136005)(5660300002)(4326008)(2906002)(8676002)(8936002)(83380400001)(38100700002)(31686004)(36756003)(6506007)(44832011)(6666004)(53546011)(6512007)(478600001)(966005)(6486002)(26005)(2616005)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmtjOWZlN2orRkJVNzVTL3VMQWpldUxlU1BINkt3WElObzNKN0YyTXNyMFBT?=
 =?utf-8?B?MWpxR3dyZWM2NDE2aW00dWd3Q3BHYlRoamljdlBZcTBMNTRDQWl5NzNmWVFu?=
 =?utf-8?B?c0VuWmVyRGNFMDkvRzFZaFBLZUVJNFB2bjZJMU8xQytpcUpPNGdLSzVUUE1V?=
 =?utf-8?B?dXhaKzJxcU05emMwb3ducXZ3YVRqVENJR0FPZGd6R1FGUDZrYnZnamxRTzFO?=
 =?utf-8?B?aDRqYU9PdmJOdGdpdWhQb1BjY200a1lTTDY1WFFYVmdXS2Qza0dZQlV1YjJB?=
 =?utf-8?B?blhaMFJqK05DZ0dkNFdYQ0pFYzBINW94Q1ltZVFzQ0l6ZWh5Ry9OQUR4Y21K?=
 =?utf-8?B?MHVldVJTL2VmTm9PWTdsYjkyUituSEMyREdyVEI3MTI3TXRzUVV4SlVOYWNu?=
 =?utf-8?B?SmJ3Zy9GSDY2dmtyRlJ3MEpISC9FblVsMVd1ejlTYlJudGpoUG40MlpaUElV?=
 =?utf-8?B?bVNtYmtkN0diakhIVWJlNU0zalBQYkMrS3Y3ZVFCZzBmUUNBKzYweC8xdFRH?=
 =?utf-8?B?dzhrUWIzNTFyeHkwY3Z4Y2k1ZjIvR0VXUDVTMG5ta2V5b2pRZyt1bTBXbTVi?=
 =?utf-8?B?S3BJS0I3WkpsSDRKelc3cTdVUXQ3Nm00WVlEUFBxWE5tT0RWekJ0dlZ6THpP?=
 =?utf-8?B?TnBiRHB6dUhZUEpIZ2JrVTI0NG1zS09TczF0dlYvRkdpaklQbFphVGw4Nktt?=
 =?utf-8?B?SkloYVlpQzhQdnl4UjBtbi9UbEJKZkp6WVpEekl0NVBNK1lTdUpMMzRlR1JH?=
 =?utf-8?B?MldUMlVTS3RQY2ZueEU2eEZ1OG5wTkVzMWNIbVJ4a0dpRE83UTdTT0w1Q1d6?=
 =?utf-8?B?dHJTcVZrOVRjSHdnMFhJTGJJb3pqUjF0TXY5ZjJEamVxN3JaOE9wZFBwRmt6?=
 =?utf-8?B?aU5CbzFmM0FpbGFJRXFjbXRVT3FOV2tOditEOW9QT2dWRktaVCtxZ0hxWW9M?=
 =?utf-8?B?UDNPRkRmSm5JcU9BNFBkbFdHNkk0WlFRcS9TZkhqZUMva0lDWHJQYko4TEdy?=
 =?utf-8?B?UzViVm5JVmlsbEtCQW8xTlg4aUhjMVlFdkRLczlBTFJoMlh5VmJZYW9kVkFt?=
 =?utf-8?B?SkVyZWh3TmRKOVNGT1lhNWIyd2R4d0lHVGRibWxPL1BCOWh0SHVNMFFJdnF0?=
 =?utf-8?B?Um0ybWlqd3QyZlhxc1k0Y3pPbk9UemtjbnMvdUtnb09XL0tNaVE5STRTcEdT?=
 =?utf-8?B?b2ZKKzN0alpraTV0T2JDU3NvdGkxYVNZMS9rZlJzN2h6QXB4eWlqN25HVlFO?=
 =?utf-8?B?cUhGUW41ajFWU1lmWlF2V29kN2ZtTU9oU3ZBQkFuRDlkdm9vc1A4Zm81MTVK?=
 =?utf-8?B?RmVrYlBXSVBDS05Nb01uR1MrcmNkRElsK3p3dHE3b05nWk90Q0tUYWhGTWVy?=
 =?utf-8?B?RUdhbDdyaXRPWTNERnBic0xVdmpKTjI4UTRnck04M1I2L0g2SkRhb3hnSzBB?=
 =?utf-8?B?MTRWWE10YU5pL25RcVJqS2xjOXdkSWhiU1VTb0NEdVQ2UmlxRUx5ZHF1Vldw?=
 =?utf-8?B?N3hwRGFadDZjMGlEandQWnI3R1lSYll2V1grZWVPUXFhRW9aUHozNGx0dFhL?=
 =?utf-8?B?Tk01MnpWSHRCQnBOMmkvajZENlk1Z0lYdkgyekt6elF3czNZWmtlR3JnUmZV?=
 =?utf-8?B?ZGxqcGJFaDd1SnJpZlhTU0F2RWd0aVV4d2FjNTJ5Q2VJQjhHQlBiSnhNcnhz?=
 =?utf-8?B?SDNEeVhnZ0NQdEMzeGxxT2dZbGlYenlqbUJPeVprWTZvdXJGViswR0M4K0Rm?=
 =?utf-8?B?WnBEY1R0MHE2RndRRzJ5aEc1VnZubFU2TlhtbmZVRWl0YzcvcVF6Mm9tRDlK?=
 =?utf-8?B?WllLelFYSGdUeFJDUmk3b1BPTmpYQkhNMVFHc2kyWmRBTVByVHNhblpxWUJ3?=
 =?utf-8?B?OW1GVTI3d3JLQUE2ejI2aUZzZW1mRzg4OVNya0xmYTZPQjRua2FiZ3BYaGEx?=
 =?utf-8?B?WDhzbmNxS1J2ZjNwMEpIL1BrOHF1ak9VL1luZUE5T1pCSmVSMXFza0NHMERU?=
 =?utf-8?B?Tlk1Vi8rNUF6d1JCTU14UFA4NDFDQ0RzcmNQRzFsZXNmWWVQZTJKNW1JQWY3?=
 =?utf-8?B?d0twam5TU2dWYVZtZTFvODkrRzJIVWhKUzB3UUNBS3hGY1lOT1JiMUMzVy9y?=
 =?utf-8?B?cVRUMi9XWWttRHo5dkFXMFlrbkpVOTQ3OWZjMVZmZmVNUWZxZ1V5QmxJa2NL?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c49431a-da9c-4ec2-c2d4-08dc27b9043c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 08:44:37.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fALt2tz+JIhd9mbhfwhtcq9vzwrz7JTHJiYI6drbv9oJIegoTKeWuIi5f0mjauVAf0l7BEXpxGZza1eeGadrmBo950NhvV6G+vcrfFiw2gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
X-Proofpoint-GUID: eoEher1i492iZ30QStjN4zyhyET7IrBJ
X-Proofpoint-ORIG-GUID: nEoS_Mw2rOEKwcPz8LVEanjokexRxGM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4175A2Yt014007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195045


On 12/22/23 22:25, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> These patches were rejected by upstream:
>
> http://lists.schmorp.de/pipermail/rxvt-unicode/2023q4/002673.html
>
> Will you be sending a revised iteration?
>
> Ross

Hi,

V5 is sent,=C2=A0 please help to review, thanks

Regards

Changqing

>
>> On 22 Dec 2023, at 08:38, Changqing Li via lists.openembedded.org <cha=
ngqing.li=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * tic is from ncurses-native, and set TERMINFO as
>> ${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
>> rxvt-unicode terminfo will be wrongly installed in there.  set the
>> outdir explicitly to install them to correct dir.
>>
>> * Add ncurses-native as DEPENDS to fix reproducible build issue
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>> .../rxvt-unicode/rxvt-unicode.inc             |  9 ++--
>> ...ile.in-set-outdir-for-TIC-explicitly.patch | 44 +++++++++++++++++++
>> 2 files changed, 49 insertions(+), 4 deletions(-)
>> create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Ma=
kefile.in-set-outdir-for-TIC-explicitly.patch
>>
>> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/re=
cipes-sato/rxvt-unicode/rxvt-unicode.inc
>> index e7d520ebef..b8ef0d75e5 100644
>> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> @@ -6,13 +6,14 @@ terminal emulator rxvt, modified to store text in Un=
icode \
>> output. It also supports mixing multiple fonts at the \
>> same time, including Xft fonts."
>> HOMEPAGE =3D "https://rxvt.org/"
>> -DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty"
>> +DEPENDS =3D "virtual/libx11 libxt libxft gdk-pixbuf libxmu libptytty =
ncurses-native"
>>
>> SRC_URI =3D "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${=
PV}.tar.bz2 \
>>    file://xwc.patch \
>>    file://rxvt.desktop \
>> -   file://rxvt.png"
>> -
>> +   file://rxvt.png \
>> +   file://0001-Makefile.in-set-outdir-for-TIC-explicitly.patch \
>> +"
>> inherit autotools pkgconfig update-alternatives
>>
>> PROVIDES =3D "virtual/x-terminal-emulator"
>> @@ -55,4 +56,4 @@ do_install:append () {
>> install -m 0644 ${WORKDIR}/rxvt.desktop ${D}/${datadir}/applications
>> }
>>
>> -FILES:${PN} +=3D "${datadir}/applications/rxvt.desktop ${datadir}/pix=
maps/rxvt.png"
>> +FILES:${PN} +=3D "${datadir}/applications/rxvt.desktop ${datadir}/pix=
maps/rxvt.png ${datadir}/terminfo"
>> diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile=
.in-set-outdir-for-TIC-explicitly.patch b/meta/recipes-sato/rxvt-unicode/=
rxvt-unicode/0001-Makefile.in-set-outdir-for-TIC-explicitly.patch
>> new file mode 100644
>> index 0000000000..50d8d2d9e0
>> --- /dev/null
>> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-Makefile.in-set=
-outdir-for-TIC-explicitly.patch
>> @@ -0,0 +1,44 @@
>> +From c88c94e629b6aad1609d13f355c52e5a3acc8d2a Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Thu, 14 Dec 2023 17:33:15 +0800
>> +Subject: [PATCH] Makefile.in: set outdir for TIC explicitly
>> +
>> +When doing cross-compile, native tic's TERMINFO usually
>> +set as a native dir, which could not the target install dir,
>> +which will cause rxvt-unicode terminfo will be wrongly installed.
>> +set the outdir explicitly to install them to correct dir.
>> +
>> +Upstream-Status: Submitted [ https://github.com/exg/rxvt-unicode/pull=
/4 ]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + doc/Makefile.in | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/doc/Makefile.in b/doc/Makefile.in
>> +index e3d1fe8b..3477551a 100644
>> +--- a/doc/Makefile.in
>> ++++ b/doc/Makefile.in
>> +@@ -69,7 +69,7 @@ all:
>> + sed $(SEDREPLACE) <$< | podselect -section "RXVT-UNICODE\/URXVT FREQ=
UENTLY ASKED QUESTIONS" | pod2text >$@
>> +
>> + $(srcdir)/etc/rxvt-unicode.termcap: $(srcdir)/etc/rxvt-unicode.termi=
nfo
>> +- tic -C $< >$@
>> ++ @TIC@ -C $< >$@
>> +
>> + tags allbin:
>> +
>> +@@ -100,8 +100,8 @@ install: all
>> + $(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(ma=
n1ext)
>> + $(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man=
7ext)
>> + $(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext=
)
>> +- @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
>> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
>> ++ @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir=
)/terminfo || \
>> ++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(=
datadir)/terminfo
>> +
>> + distdepend: alldoc
>> +
>> +--
>> +2.25.1
>> +
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192865): https://lists.openembedded.org/g/openembe=
dded-core/message/192865
>> Mute This Topic: https://lists.openembedded.org/mt/103315499/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

