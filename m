Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18784C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:42:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.480.1684942971839731783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=R6lvpleH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45082ad12b=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OEWbSZ009561
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:42:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jVR//SQkcIpWX9xxuIWOhGTpQEc4/LxoscL95jY4aUE=;
 b=R6lvpleHckkRnYKej/JRKk/J4kzTAsT6jq8/b21L19bw/HRL0CY+FNS0eOvbyENs57dm
 0rwm0n76UaqjtD4+EdYYyyqKohe4dgLtjO4koPtVvWCgAruqq9UN1FdBUnX+WLQHK4sj
 B/49VAX7p8Y1tseiP/Xi43Mfj8dC6muso1KWPlywwLfABBAoJVb1u0BKcywwEHFA5ysk
 X+0vOVzfVYwTtVuEzIOxIVxi4FKpZzzZUoT24RhWnhbfYMeuRPvAOGu0LGZTRBGgFabm
 6XqkjJg6Blxa9I7j6ma7DniQvnxITNvt9CtWuLyJ7dK61TSreY/l7sQivn8bnhEgLQwR tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhbvff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:42:51 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34OFfH4i009435
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:42:50 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpwqhbvfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 08:42:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0G14uVr/L/5KQkCVdCGd/M2aysDJSw0gSGoTxH/DysQlexB1qa+dK0qR2+SZqo4qlylCqBrGeuN5Y2fsmbIIW2nASu+FiLSTcQT/TLy3B4427P0v4Z9ARmiubdtsg8MZjglT9kqHkjt/pgrFRZby6VwFNUWvpJxhJMV2mYICRw+Qp88H8oFoWhXEegO+AJC33ojxOlKP2Rx7w0ftCRsry0u2Olb5KwtD4Bx5jcGpBqxs1lEdMGX74Anzo8XwxDOfenaVsafqMu6Ddp1EqZOB8BFF12AVBQ92aP0y93rz8ACaz6g12z6PatSTv9orVxefBtc+bv7Ynyy9Q6HQdNQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVR//SQkcIpWX9xxuIWOhGTpQEc4/LxoscL95jY4aUE=;
 b=L50DJgATOJ2swicA6sdFwPKpiwKdY9UVD6zyNR4SkVhlV3gGVXu9udmQzHLA917lpmOdLPjP7sssU6wD1t/T4zj4GkdndjHa64siLSfCIRAL5JoxzbegEJFP3ZJwCJIlK/2JRoL52IYCI4Ult1YBcfN97J1fYiX3k8UNs87TRVjwK35Qfp5z+rqq6htTXjEkap3cniypIf4CDeAikuuPZROC2dIxjiWTBhkg+jyZ+jGs29C91z4ENgPoEis5ECXDsKgHQHa1jnb81QnM+I8PoEv/7LxLntNCsOZ+GLpRGMsY6JZ4750SwJpk54zTLiJ+QN3TevYuv3oXpmMjKRiv/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Wed, 24 May 2023 15:42:48 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 15:42:48 +0000
Message-ID: <d6301861-b901-ae3b-b233-59fd0c5d3113@windriver.com>
Date: Wed, 24 May 2023 11:42:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [kirkstone][PATCH] go: fix CVE-2023-24540
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>, schitrod@cisco.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230524052853.1666676-1-sakib.sajal@windriver.com>
 <SJ0PR11MB67172DFAB24257125B2E4B50DC419@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <CAOSpxdbUv-1dTN1zP_icOka5t=MxoLJh4ANykHW-4mRcXDWE9Q@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <CAOSpxdbUv-1dTN1zP_icOka5t=MxoLJh4ANykHW-4mRcXDWE9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BL1PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:208:256::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a96d07c-9195-4bf1-60c6-08db5c6d8681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GnjhWNUMxOR0eCIXGxmtPnm+X4Xtev8JyS3O20oD91s+2rLhqSrt5AdTXxT0/q0zcT6nEk0Qid1BHO2OcZTVBoBGNgnp+DCFnDnbAUZFAuJUzdezVsXm63pNg8S/k9YGa6rOtctz5OGRb3leBDJbOAtaAeeSuYx0UdBZn3//3lwT6CIU68VyhEIvPiFfGxhVY2UfA3Pf5uY4uz61M++mTj1jcrTYW9ID4fKrCqotHnwqjX864cLIZhUHrsxMHxo6W/fu4JcqSDYCVkBw5zdrsfcqCWj0I7chxn5BPc4hYw+bcbW6+9kMXdsmmibanzMDkxgy3ejQBIu9tVUFeIAIhLFzzD5tLZzTdNb0QLdk4/kd4vZRMB4X2XcT7DvJTuiiP1ZJSSGzTZ1ReqAc7xRs4YtBxlAHejI8GyVV/ny8YTvPsv1hdZLEpl6yt5p7tlm2xUyKkIEJCvZ/+UvcjbaWOlavhutoM2PjUOkc30gWbis/FqNHsZZhXGCdnAijJ3E5kcjpXaDgf9fCgAxxT45DLr0PsNQsVlpav1nSUYXxnYaQcQbnbag/hQsRfdO+jptBAqctmkJAnE/n0RXbGTGQ0CoAoj6DZ0uQLyTXm0wowEkrOgSbqLn3c7ftBqevhvrGz+8/97zWq3cxj+elt57W7B3eoTkw+gxnTRcYYtmv3so=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(451199021)(5660300002)(8676002)(8936002)(186003)(53546011)(86362001)(83380400001)(36756003)(2906002)(2616005)(31696002)(44832011)(38100700002)(6506007)(6512007)(26005)(4326008)(316002)(66556008)(66476007)(6666004)(31686004)(66946007)(478600001)(6486002)(66899021)(41300700001)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2d1NlovUWRTeXQxRUsrVmxKdWdvV2RrQWRnNGRNWHYwTHd4RDRKNURjazls?=
 =?utf-8?B?N3JNRmtONU5JODVYZDFrcVhRdGdTcG5rb2VoT3Z1eitoMTgyeWZhTU9ScGQr?=
 =?utf-8?B?S3lhK2lBcGVTS1NHMk5WdUJSRWg0eUEvQWZCNi83bTVSVFdiallGd1hoS09H?=
 =?utf-8?B?RXdrN0tmZ3Q1aFdBUnZrL1FOOEpVQVo4SytnTUd2UkQwdmwyd3BCeW9LcDJG?=
 =?utf-8?B?Q3hnS3NhVkxwbXNEOFoxZ29icmdoNDVGemhtakp3Ly9vdWtybHNIRjdPMXJq?=
 =?utf-8?B?SDhPRnUrNk5JTWlkTGpDc0JtNUp5OTE2Q3Vueml1S3NHUFZESFlWbW1WMU92?=
 =?utf-8?B?aUwxOWplcTNmOS83bmFheWRUL2poT3IzWUQ4NE5NNFdTdEIzaGx6b283MTBU?=
 =?utf-8?B?V3NDN1Zxa0orTXBvOUZ4c25PQldsUzZuNXdxR1JYOTdERmZtZnVlTXpLd215?=
 =?utf-8?B?cFcxeWxMS1I0K3J2ekU2Z3pQVmhHOWVnLzA2V1doYkRKQm4zaHkzRm12OXdV?=
 =?utf-8?B?WTVLWm1KenpLaisrMzJJM0xzVlo0RWMrWHpvV2JiSWtmdjY4TGg5K3EwS0NG?=
 =?utf-8?B?VUNvbmVxRU5Rd0UxazFSYkJlRzJ1R3p5TDJVdnJuMXR2b1VSQ3V1UVpDdkVo?=
 =?utf-8?B?dTgxQi9PU1g2dldVOEYzQzlBYnRuN09FUEZ2YVpmbE9jYVNJYkpyczJ1M0Fz?=
 =?utf-8?B?QzFkelhYNUNkcWJKZ1JRYjk3c3hLdVJrVFBhaFB2aHlJZmlTKzJDamF1c2ho?=
 =?utf-8?B?eUd3VEdoaDgzaFJ4SUNQdVVFdUVqNFZKYVZMdk9kbmZNVHB6OGkvMHpQRFM4?=
 =?utf-8?B?T0Q1OTZ0Tk1XTUkwcmhjVjVvZDd6eHd3VWx6WGlxZXJTT3BlTENYMXVpY1ph?=
 =?utf-8?B?MlVnSlQ4eC81TW12RXF5bHlEaXltQWsvbitJUGF4cHdETFhGL1FnbXRiM0xw?=
 =?utf-8?B?RFJuMUdkSkN5NlAvc3hQb1hmUlFDMEFBSWtTNXBNZHNIQmNhaGlHenFXRk9Y?=
 =?utf-8?B?UGlSaGFzLzk5a1YxZGNUbjFrbVZOZHZDNWdZYUdYUHM4RG9JcFRrQitxOGsx?=
 =?utf-8?B?SlR3VmFteGozWFZoTkNzVk1WKzhkQkdIdmFsQlpYSG9UTVBWTFErUllwU0pD?=
 =?utf-8?B?bTgvOFRpb25RQWVORGlxYjZpOGpab1lrWFRPSWlySjlScmdxejRVM0J4UGtK?=
 =?utf-8?B?ZW0zUG5vbU5YN3dnTEdDMlZqQVMySUY5RUd2SHo5eDNEazFQMnE0cHRoWnJC?=
 =?utf-8?B?VFVnVXY2OEdxa3lsZ1VjMkhDdjFxaVpjeHFXYXBxMHJqUnpnM1RXL21iM2ZN?=
 =?utf-8?B?ZDcxRjdOa0RadllabkhmK2ZUSDlMRGU1d3BHd0VUMm9WWTJiZlkzSzlHSzR0?=
 =?utf-8?B?U1BPRS9aVkVzUTY4MERWUHRhenBKaUxGalJ2aWZTU3grZ2FkMmZCeUpwaHZF?=
 =?utf-8?B?Njk2d0d1NjQ4TmZUYW5oQXJNeDRCMHRtRmFjRURveS91NnhKb3pTbnFWYjBD?=
 =?utf-8?B?ZTdSS0I0KzRSYUJ3Mi9ST3Y4bEx4MHBEaHVML1pFK2V6eTVpV2pNMlRXVGpz?=
 =?utf-8?B?MDl5UWY5dGlYWXpURGR3Vy9qN05RbFVlVzlKMDFiVDQyU3pKb3ZZaFJ3VVJr?=
 =?utf-8?B?SkM2RGVLTU8xdWNSbkNZV2gwbDVxVWdqekJzaldOL0tWc0tqdEo2OS9HTjY3?=
 =?utf-8?B?K1NoVGdFVDdLank4YzBoWG1KUEVhaFc3ZDd6ek9LT2haU3BEVDZza01ZdTI1?=
 =?utf-8?B?NEQwaUx1QlI0S0d4OVkvRk0yZHUxMjlpWXFhSHphSTcrUFp0dFdpdVhjSzI3?=
 =?utf-8?B?eHB4dzJkRm5XVlBPYW1qN0xrMGtDTHk2OWhMbDVFdGEwV1ozOEhXM04zWGFx?=
 =?utf-8?B?MVcrK1JkZFF6UUZIeUtrODhvL3dPekJaRmhLQWJnSzVpT2VXcjdTRUYzSW1B?=
 =?utf-8?B?NHNJNGdrdzRnbk9KYXEyc3R4SWh4TDk3eHI2QlJPbkpiZVQ1eVloR3I4eDd3?=
 =?utf-8?B?RUVGTUkzZnZPVEVyOS9jSEl2OVE5THVtUDltOTNBWEE0bXRzRW5OblN6enB0?=
 =?utf-8?B?V1NxSlNHTFZlTFlxRFFQRkRFaGdodU95cEFYUFY5QlZCdlM1a1U2MUkzWWRo?=
 =?utf-8?B?TWR0OTloTHhEbmN0aEM3Sjd1Vm1uNzM2SUhTSGticDFheHRXMVYzOUkzNkl5?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a96d07c-9195-4bf1-60c6-08db5c6d8681
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:42:48.2302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQ0e+PjoNrwuWPckqVCpbJxpT4dd/zoJPVwyzaBby/njprLi0NrYmcfvv4rL5a3ast12YD9zSF19HQemg+NeVXPyI2UbgLzqHaXKpQiaRs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
X-Proofpoint-GUID: sr6_w8yJv9ZR8Nn7pMcrMOE_4p8N-CgR
X-Proofpoint-ORIG-GUID: YSdSZB9OxTGobsWiJNzZH8MfOb2W8l88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240129
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34OEWbSZ009561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181685


On 2023-05-24 11:26, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, May 24, 2023 at 3:59=E2=80=AFAM Sanjaykumar kantibhai Chitroda =
-X
> (schitrod - E-INFO CHIPS INC at Cisco) via lists.openembedded.org
> <schitrod=3Dcisco.com@lists.openembedded.org> wrote:
>> Hi Sakib,
>>
>> Its good to have full URL link inside .patch file as below:
>> CVE: CVE-2023-24540
>> Upstream-Status: Backport [https://github.com/golang/go/commit/ce7bd33=
345416e6d8cac901792060591cafc2797]
>>
>>
>> Its good have some information on CVE specifications in commit message=
:
>>
>> go: Fix CVE-2023-24540
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-24540
>>
>> Upstream patch:
>> https://github.com/golang/go/commit/ce7bd33345416e6d8cac901792060591ca=
fc2797 (go 1.19.9)
> I've taken the patch and made the above referenced changes, so no need =
for a v2.
>
> Thanks for the patch and the review!
>
> Steve

Thanks for the feedback, I will incorporate the changes in the upcoming=20
patches!

Sakib

>
>> -----Original Message-----
>> Backport from go-1.19:
>> html/template: handle all JS whitespace characters
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
>>   .../go/go-1.19/CVE-2023-24540.patch           | 93 +++++++++++++++++=
++
>>   2 files changed, 94 insertions(+)
>>   create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24540.p=
atch
>>
>> diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-de=
vtools/go/go-1.17.13.inc
>> index d7cb47ebf4..e5e9d841c4 100644
>> --- a/meta/recipes-devtools/go/go-1.17.13.inc
>> +++ b/meta/recipes-devtools/go/go-1.17.13.inc
>> @@ -30,6 +30,7 @@ SRC_URI +=3D "\
>>       file://CVE-2023-24537.patch \
>>       file://CVE-2023-24534.patch \
>>       file://CVE-2023-24538.patch \
>> +    file://CVE-2023-24540.patch \
>>   "
>>   SRC_URI[main.sha256sum] =3D "a1a48b23afb206f95e7bbaa9b898d965f90826f=
6f1d1fc0c1d784ada0cd300fd"
>>
>> diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch b/m=
eta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
>> new file mode 100644
>> index 0000000000..4ed9ba7096
>> --- /dev/null
>> +++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
>> @@ -0,0 +1,93 @@
>> +From 2305cdb2aa5ac8e9960bd64e548a119c7dd87530 Mon Sep 17 00:00:00 200=
1
>> +From: Roland Shoemaker <bracewell@google.com>
>> +Date: Tue, 11 Apr 2023 16:27:43 +0100
>> +Subject: [PATCH] html/template: handle all JS whitespace characters
>> +
>> +Rather than just a small set. Character class as defined by \s [0].
>> +
>> +Thanks to Juho Nurminen of Mattermost for reporting this.
>> +
>> +For #59721
>> +Fixes  #59813
>> +Fixes CVE-2023-24540
>> +
>> +[0]
>> +https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular=
_E
>> +xpressions/Character_Classes
>> +
>> +Change-Id: I56d4fa1ef08125b417106ee7dbfb5b0923b901ba
>> +Reviewed-on:
>> +https://team-review.git.corp.google.com/c/golang/go-private/+/1821459
>> +Reviewed-by: Julie Qiu <julieqiu@google.com>
>> +Run-TryBot: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-by: Damien Neil <dneil@google.com>
>> +Reviewed-on:
>> +https://team-review.git.corp.google.com/c/golang/go-private/+/1851497
>> +Run-TryBot: Damien Neil <dneil@google.com>
>> +Reviewed-by: Roland Shoemaker <bracewell@google.com>
>> +Reviewed-on: https://go-review.googlesource.com/c/go/+/491355
>> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
>> +Reviewed-by: Carlos Amedee <carlos@golang.org>
>> +TryBot-Bypass: Carlos Amedee <carlos@golang.org>
>> +Run-TryBot: Carlos Amedee <carlos@golang.org>
>> +
>> +CVE: CVE-2023-24540
>> +Upstream-Status: Backport [ce7bd33345416e6d8cac901792060591cafc2797]
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + src/html/template/js.go      |  8 +++++++-
>> + src/html/template/js_test.go | 11 +++++++----
>> + 2 files changed, 14 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/html/template/js.go b/src/html/template/js.go index
>> +b888eaf..35994f0 100644
>> +--- a/src/html/template/js.go
>> ++++ b/src/html/template/js.go
>> +@@ -13,6 +13,11 @@ import (
>> +       "unicode/utf8"
>> + )
>> +
>> ++// jsWhitespace contains all of the JS whitespace characters, as
>> ++defined // by the \s character class.
>> ++// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide=
/Regular_expressions/Character_classes.
>> ++const jsWhitespace =3D "\f\n\r\t\v\u0020\u00a0\u1680\u2000\u2001\u20=
02\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205=
f\u3000\ufeff"
>> ++
>> + // nextJSCtx returns the context that determines whether a slash aft=
er
>> +the  // given run of tokens starts a regular expression instead of a
>> +division  // operator: / or /=3D.
>> +@@ -26,7 +31,8 @@ import (
>> + // JavaScript 2.0 lexical grammar and requires one token of lookbehi=
nd:
>> + //
>> +https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.htm=
l
>> + func nextJSCtx(s []byte, preceding jsCtx) jsCtx {
>> +-      s =3D bytes.TrimRight(s, "\t\n\f\r \u2028\u2029")
>> ++      // Trim all JS whitespace characters
>> ++      s =3D bytes.TrimRight(s, jsWhitespace)
>> +       if len(s) =3D=3D 0 {
>> +               return preceding
>> +       }
>> +diff --git a/src/html/template/js_test.go
>> +b/src/html/template/js_test.go index d7ee47b..8f5d76d 100644
>> +--- a/src/html/template/js_test.go
>> ++++ b/src/html/template/js_test.go
>> +@@ -81,14 +81,17 @@ func TestNextJsCtx(t *testing.T) {
>> +               {jsCtxDivOp, "0"},
>> +               // Dots that are part of a number are div preceders.
>> +               {jsCtxDivOp, "0."},
>> ++              // Some JS interpreters treat NBSP as a normal space, =
so
>> ++              // we must too in order to properly escape things.
>> ++              {jsCtxRegexp, "=3D\u00A0"},
>> +       }
>> +
>> +       for _, test :=3D range tests {
>> +-              if nextJSCtx([]byte(test.s), jsCtxRegexp) !=3D test.js=
Ctx {
>> +-                      t.Errorf("want %s got %q", test.jsCtx, test.s)
>> ++              if ctx :=3D nextJSCtx([]byte(test.s), jsCtxRegexp); ct=
x !=3D test.jsCtx {
>> ++                      t.Errorf("%q: want %s got %s", test.s, test.js=
Ctx, ctx)
>> +               }
>> +-              if nextJSCtx([]byte(test.s), jsCtxDivOp) !=3D test.jsC=
tx {
>> +-                      t.Errorf("want %s got %q", test.jsCtx, test.s)
>> ++              if ctx :=3D nextJSCtx([]byte(test.s), jsCtxDivOp); ctx=
 !=3D test.jsCtx {
>> ++                      t.Errorf("%q: want %s got %s", test.s, test.js=
Ctx, ctx)
>> +               }
>> +       }
>> +
>> +--
>> +2.40.0
>> +
>> --
>> 2.40.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181673): https://lists.openembedded.org/g/openembe=
dded-core/message/181673
>> Mute This Topic: https://lists.openembedded.org/mt/99103273/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

