Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F813EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 03:47:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4358.1692762445235933953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 20:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KXXdzt49;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7599d809b0=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N3lODw009824;
	Tue, 22 Aug 2023 20:47:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=4GNCbPMzarzhzbsziCGoBXOO5C9ezD+B1Ib66bkWAKg=; b=
	KXXdzt49x0I4pISf37Dk39m69T5Dnrymj047UkdcBmheyPP5T1ftcExkSqjNdUt3
	JJybxwtULTuBXduqKG3lRyjLUJMEZXae/xrkWfVYsZZnRv9XXUJT9OV6pzPvq8ta
	n3jk8xOC2zbe9w+CcvcSlPTMnS5/aC5Av7Bz2b2qK7KfFWWnS4TBSCdjsDrK1g5h
	tyvw/qL+RVlQhAxUi8YZGX+fPuF8c2vuBQ5MR1Z3JkO7HLQIVHURANkF9TKPwnvL
	Z4OeOmWqJLM4k4UVJJxguOG1GOKqap59NErnME/DepHRcjzq/g4MKmlPc0VdhSgb
	qpTQ/pE4EDXzOfn5UmGW9w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dgcg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 20:47:24 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37N3kji2009471
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 20:47:23 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20dgcg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 20:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiVH0RlmheAxnvBDZqQaB2mK8DHbMxoj0ZgLV+qUeLmt/G+JB1hXUkoCNK/fBji0mFq4ik3dScZgOW2FiivoRH49ZppOzCVxrJa6TLTbaTgFGPWNY4Qly9xmc1RWN5s6GE+qDzf6HcVNe2eky+LA6/cnXFBDxuO1PKQb/kht0WTKo5OwKyN/UftzP7JDACrsNp5uiIoF8sFt1GZmlKO6VTjtFjaj1Xy23cr+DWt2Xh8578CWT+jHr6G4IYhlQZAuzEU5OMap1l7mHmhwzq8yYCNUk5MamXPYs03V2+5oOfx3a1I7TGt0SuSY+VP9vChLQl9Qu2QqdufdqLhoaCqtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GNCbPMzarzhzbsziCGoBXOO5C9ezD+B1Ib66bkWAKg=;
 b=hT7vBKSVkRdrPQBHP38HT8VGIlUxOwyj78BQRlc3Ttr88GNQqgcRGvqZIJKM8NVqChGngPurxPfSHshdWxVu3N9Z03EuD2Qw8j1mD1zi0qVvg7hW9fqqZwRuLJxtAFU9D+jiE4bDvlpfyYIxyr3DRMjM81X5GmpToCnEHogI3D2Vl+5z/OPBUzxqDJ9cB3piM+XenvU7ChJ991ZX+gJg3bL9DOI6+/EetCI7DT7Eue6N5gHMH02Qu6V9IkJip5hE4wUWYWima5zyLMRrlBZxSG0hN9OsiYbxTfMeBLclbFqBgyG8KPVXYasNfbv1YthbeAg/vAc8D7qDNIivngWrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Wed, 23 Aug 2023 03:47:20 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 03:47:19 +0000
Message-ID: <99a20e0c-0931-f07d-3a5a-035596a34d6d@windriver.com>
Date: Wed, 23 Aug 2023 11:47:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] llvm: remove libLTO.so.*
To: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230821023652.47360-1-kai.kang@windriver.com>
 <257e2521-4ae5-4884-867e-64eae0b607eb@gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <257e2521-4ae5-4884-867e-64eae0b607eb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DS7PR11MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f299f65-dc4e-4ccf-c92a-08dba38ba6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Et1u0IhUSTIOMTfe88/eKhu7zz9qmQNmo9MQ921srMab58kDUzLAQqqWs0xDP+rZkINvpD3h8HiyozCY5vwjo3fbf/X7lHK2hGeGcjina3QQVsCCJTQn2E/iCMJdeTP1JB59riVTrgMDzfBkgPRSsOHfG6IOdogMC0plXl78Z8SeyZt9XN75HLl2+OXHTsnN3n4pRrkn2JKbXqwUcpL6zqrvS5Xi9tUC/C92lLtQXs1WPARek+TaQgG+YFNBf6NyjhjWGThmUm1U4gGvMVWgmscOoxswfpSviIGHHaNT7tBmup7Z9zWAicgQEoX4FKBMK/ZjsAJNem3DsWDcZvyUctFdD1gB+wTw2nVOh01dNrFEU/RKRJc/+oHvA98pT6N7MKesjftRCQFxTkdVGTniYokyckxLbVkrM5diuFyNcj/HMhtJDojXqmi3uDqc/n8fTU507WBIcEvAyVw50wjwgfTiGaDarkRdWf1iuSyiRZqhAN/DJcFmlSqML/yXQuSFmEflG4ciGOSviFtCa+lnkNqqGlIW3KzuagwuZ7ZZe+LsWLgab2iMznBWund7xmEPyGsm1Z4upqi/ZQ3+6myxPXKAfUnRTMuR0F+Mhwp8XsUwhYRdl3D8Jk8cBuYSL30ktVHvQtnaDmnzx8T2PZ6PRjbzDkMhRGFfDyS2DgVbYjLuE81BQitRP2rudxXZF1of
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(39850400004)(366004)(186009)(1800799009)(451199024)(6512007)(66476007)(316002)(66946007)(66556008)(110136005)(66899024)(8676002)(8936002)(2616005)(36756003)(41300700001)(478600001)(966005)(6666004)(6506007)(53546011)(6486002)(38100700002)(83380400001)(2906002)(31686004)(86362001)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eS9EMmFlaDNvdTAwWGkxWlh4MEhtanI0T2gwT3dDbkFHSFY0eDdUa2N0NE83?=
 =?utf-8?B?UFhGcm9vaWNsdkVWQUUvUUZyVm9Yak4yVHZyTCtXNEF3d2dUVkgrQXBocUxE?=
 =?utf-8?B?anlhbHV3MVAwL2lsbU1jbDVNTnAwWkdoWEJpeW9pcmNvL3RMZ0hMdmNWOVpD?=
 =?utf-8?B?M2k3S0g5T0RoUXFmOVM1THMxeC8vaTc3bEEzVmYzYVlIRWlUajFIbDgrT1M3?=
 =?utf-8?B?c3NrWDdLemp0eXBsWUlaanZkK0l0eXduSDloeG9Vc0J1QXRnY2ZmRkd5eWQv?=
 =?utf-8?B?eStVOUo2SXdDQ2ZleGhYN2JaaytrRHVZTTd4T1pEeUtpUTU5dmIveFJCQjhJ?=
 =?utf-8?B?Qkl4NFZoaUxwT1hOMG5Ba2R6ank1MDd2N0ZJRDQ1STV4bUxPMDNCcTltdXBE?=
 =?utf-8?B?VmpKeDFGT2prRUJ3N1AxcUN1S0Q4cmtGc296b3BmYXZuLzZ4UjZOMzR5ZVFW?=
 =?utf-8?B?Yy9XemtqZFpBU0VSQXpEUXpxL1QxZEVpbXRWVWs3WDRLb0w5U1lxSXJaV0lU?=
 =?utf-8?B?eVc0ZUliand3dG9iL1VmcEM0dm9BRlhvUVVDb1hORERDTXVKTEk4ZUVQVDJx?=
 =?utf-8?B?cEZzREpMSmtxQjdTTHJvekJETlptSnkyYjRWUkRSWVBNOHZIWW01NTNyRTZG?=
 =?utf-8?B?NFlRa0IzVit1eDl0UTExTTZjQXRBaC9uWlF4aFY4V2VjT0FqeURJYkpZOSsr?=
 =?utf-8?B?ZE1XdktsTS9EamJsa1B0MmQ3YkZ3MGNXNURqQlpCWTA3eWxGdERoSHB2SHUx?=
 =?utf-8?B?MDFYUHNiM0VtRXpkM3Z2OWJMcEp3YnE2QTdyQlk4dzh3UzlvdlVuMTN1N3cz?=
 =?utf-8?B?ZkZIVzV2UmlqaFlTN1ZHQUsxV3MwWlhmOXNrTC8xLzVOVGo3ZG5XOUVHckRO?=
 =?utf-8?B?QjdtYlRUL0VHUWFRRUpiWUFpSGdJZGdOeWdWbzlPUlljMnZJWFZUUHlEQXFC?=
 =?utf-8?B?am1Vamo4ZTJXL0RRVXgyemg2YytEQVFJR0J3b09NYThsMFFyZzRpVUhoVUk5?=
 =?utf-8?B?cHFxK0ZZaTFTRk1FQXQ4VzZMenpSSUNDeVozWXVwWFpJNythMm5pRk1ncFVQ?=
 =?utf-8?B?SU1VNWFXV3RaMHduTHBsYkN5Nmw5alE3SEJWWTJGUVYwQTdWYU91OC82UGZS?=
 =?utf-8?B?K0l6Q0pER2pxY2NQZVNrbFI1KzREOVRmT1dWaWZ2Y2tSaGhXYU1sN2xDTE5P?=
 =?utf-8?B?T0pQZHNrc2EzRUk0a3UzY1JUY3hGa25tY1ZyMXhMNllqbU5GRnlPSXBCMXQx?=
 =?utf-8?B?NVBSaTRRTTQrT1ZjWDZKbmNHOFB3V21paTY4SkpRR0w5YkJRMmt2OFNhOFNR?=
 =?utf-8?B?dm14RW9lVVVxNTZIZW9TaEtUcS9hVkNTZVdCeDFuLzhGOGhUVUVEUW1ZbzZL?=
 =?utf-8?B?Z0swQWh5WjdwSTRQa3pzUnJpKzBEV3pxQXhBS0FJTmx2SGs3a2RpcjNsRXhv?=
 =?utf-8?B?ZVUwVWlkZWZab1YrTzJNQVlJVmFIZzIyZ1orZm1ZMzYyaHJxZG1VYkg4MWtC?=
 =?utf-8?B?cXpoUXZsVU0wM2hGdlRYL3FvS3g4ZC92N0RmcmdIK1ZzRkIraUZvS2VwMTRx?=
 =?utf-8?B?R0JPeWlNQUNzcDgycm05Q0NZQnNYMFRnSWxXdVB4SU13aHZseUhtM29la2dP?=
 =?utf-8?B?RC91MmVNLzJxaGhTZVYyd1N3cXYzRHNMemZLUkY0T0hNSHhUTkxLYzJ2TTNi?=
 =?utf-8?B?Zzlabkw5aEZONnZkK2xtUzBGcmlUWEVnQ0FDaWczWEdyR0EyQXF0QVdmTEE2?=
 =?utf-8?B?dDJmNTI1NkRvOGRPVUNnYVFPeFIreTJYQ1I4aEhqUlJCbzN2b1hlM3pHS0Jo?=
 =?utf-8?B?T2hTOWFOTkFFNEtZTlNRdEc4T1VEcGo3S3JabWZCWFRTNUg2ZFRPeTVVdjFS?=
 =?utf-8?B?elg5UkJOWXdTQVpYTzVzeVFTVFpnVlNvVkZZcVBNTEhJRDFodkZIalZtTjk3?=
 =?utf-8?B?QWtxcTU3U3Y1QTN6UlhUaC9LYmUreUhYZXg1eHVpRDdoYk9XWE9PTndsbzJv?=
 =?utf-8?B?SDNrdUlITG9SMXFBZDdlS1g5VjVpWG40aGUwYmZLN21TOUE2ODFMNVRKY3R0?=
 =?utf-8?B?TnZqdVhhY0pINGpUZXYxRGtxQUFSMWJpMGhqeXdPeDVzM21HVVQ1b0Nxdmdq?=
 =?utf-8?Q?SvM6sUFkaFJeflrE0HJrH1+1z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f299f65-dc4e-4ccf-c92a-08dba38ba6b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 03:47:19.7175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJulEPERkQm3LU2DWvs/ztAJlr0q8jrOLGhNbuB0mJ6EGqsTbR14toIQ4Wy1WojCG/Px/xqxrcpdmn6A+j7HMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-Proofpoint-ORIG-GUID: MrOvcSvpK4DuguBKygopXn4iQoieUHyZ
X-Proofpoint-GUID: x_hTneCR1ThX4gGSDQVjRSvjOje3o70N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_22,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2308230034
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37N3lODw009824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 03:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186545

On 8/22/23 00:44, Khem Raj wrote:
> On 8/20/23 7:36 PM, Kai Kang wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Remove libLTO.so.* from llvm which should be provided by clang and
>> packaged to llvm-linker-tools. It could avoids the error:
>>
>> ERROR: clang-16.0.6-r0 do_create_spdx: The recipe clang is trying to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install files into a shared=
 area when those files already exist.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Those files and their manif=
est location are:
>> =C2=A0=C2=A0 /path_to/tmp/deploy/spdx/core2-64/packages/liblto16.spdx.=
json
>> =C2=A0=C2=A0=C2=A0=C2=A0 (matched in manifest-core2-64-llvm.create_spd=
x)
>> Please verify which recipe should provide the above files.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> =C2=A0 meta/recipes-devtools/llvm/llvm_git.bb | 12 ++++++------
>> =C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb=20
>> b/meta/recipes-devtools/llvm/llvm_git.bb
>> index f3d6f24bd2..ce9ebfa997 100644
>> --- a/meta/recipes-devtools/llvm/llvm_git.bb
>> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
>> @@ -106,7 +106,7 @@ do_compile() {
>> =C2=A0 =C2=A0 do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG'=
, 'libllvm', 'true',=20
>> 'false', d)}; then
>> -=C2=A0=C2=A0=C2=A0 DESTDIR=3D${D} ninja -v install
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DESTDIR=3D${D} ninja -v in=
stall
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # llvm h=
arcodes usr/lib as install path, so this corrects=20
>> it to actual libdir
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv -T -n ${D}/$=
{prefix}/lib ${D}/${libdir} || true
>> @@ -117,6 +117,10 @@ do_install() {
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # reprod=
ucibility
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e 's,${=
WORKDIR},,g'=20
>> ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # remove libLTO.so.* which=
 should be provided by clang and=20
>> packaged to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # llvm-linker-tools
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${D}/${libdir}/libLT=
O.so.*
>
> is that the only problem ? I think there will be more conflicts unless=20
> we limit the scope of llvm to providing libllvm and whatever mesa needs
> at minimal and remove everything else.

It is a little weird but yes, only such error I've met.

Kai

>
> clang-native can provide llvm-native and when someone is using=20
> meta-clang, perhaps folks using meta-clang can use that to provide=20
> llvm-native see -=20
> https://github.com/kraj/meta-clang/blob/master/README.md#providing-llvm
>
>
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0 }
>> =C2=A0 @@ -134,7 +138,7 @@ llvm_sysroot_preprocess() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf llvm-config=20
>> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
>> =C2=A0 }
>> =C2=A0 -PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libl=
lvm=20
>> ${PN}-liboptremarks ${PN}-liblto"
>> +PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm=20
>> ${PN}-liboptremarks"
>> =C2=A0 =C2=A0 RRECOMMENDS:${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-l=
lvmhello=20
>> ${PN}-liboptremarks"
>> =C2=A0 @@ -146,10 +150,6 @@ FILES:${PN}-libllvm =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/libLLVM-${MAJOR_VERSION}.so \
>> =C2=A0 "
>> =C2=A0 -FILES:${PN}-liblto +=3D "\
>> -=C2=A0=C2=A0=C2=A0 ${libdir}/libLTO.so.* \
>> -"
>> -
>> =C2=A0 FILES:${PN}-liboptremarks +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/libRemarks.so.* \
>> =C2=A0 "
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#186419):=20
>> https://lists.openembedded.org/g/openembedded-core/message/186419
>> Mute This Topic: https://lists.openembedded.org/mt/100866486/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


