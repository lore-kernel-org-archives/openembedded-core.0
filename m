Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D666DC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 07:44:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19590.1644219865516133773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 23:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mTcJCpfX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9037c3f122=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2177VCwW017862
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Feb 2022 07:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=nFfztDipnVkTakYR661JeMYP0zPKXTNY+prbG/jmq/E=;
 b=mTcJCpfXpoCviDg/NOc7nn0X5e0jb9p+410mpDN/uG1Q37wg/PRY31jnVSClOikXL/m6
 wGiyQKmJ+gmGYPQpoykKsUM4vlPWfmEVTLAvqihzUOcCgU1rSdCJUJwssY+Dgk+bOVVP
 aMEemTVg1vjsUsFI7A0Z9nVFJvp0IVowyeyRZBDswOuEvn+5O45YhKNSY98eHng7gVkl
 FFkXGSKVjCh1el9Q/bGMMvv4hRrssiCy0siZZtfP9GNl03sRoOggaPA1y1G+DI5xDYmj
 Rbp5Bd5IBFbW63q4IoiHzowY8/Mb2VQsVcxVt6pWk2V8/yq8Ps1zaafl4j4ckbePDS1a rA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e1g7816dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 07:44:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAHJpODpcIZaI24ajXJE6shnR9j5f1T9tJNLAiKwQB1uclbgo0cViRIGIO9cgnnCJZdumAaQbE7O0x4i45uyxY18gef0Wdi2pFMXBSASDO12sDffD/6iXtcohYR1k1TfE+bu8KjeCB1UUGMYxInWcHwSOLGmnhD68AUM6waJMVDbrkA+2X36uYn1xc9T69USrInvZJ+nQPwnrwAkQywMAsMSO+7/QCKN0N/GYZpspGwBJ7sg/ALCBh4QSVrwTf4O4ik4ilCv5ApceRqWXn4jOITWDh7Hpr72bhKF+ZUnghqOwZOPU394jWbNB76m/RgOUfYHlDIJIOc1ed1GvRFTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFfztDipnVkTakYR661JeMYP0zPKXTNY+prbG/jmq/E=;
 b=Nh90Vvm4VCjkBGfBsmtkLeLCzXynNlxI3iZ1ba6uCOauoeiH0jRDuDGKcpr4J+0gGCJp4zs+uv8J12jV+vDLB5r27z6bmqfzAVXZIzaiGJTQlqAR9HaPHJE/x7ebcBD4eVqvpYY3vGPpWDYTE4n8CrS9ES0n0pjg1KFCDuKs/q5LQwKci0emn3ZS/6aj+Ai9cH8rIK2eK+spBbH88Ul1TAKaKKOlaTbx06e3VD8Yyj6hyb7toXwjc3FKYrCKhi69H/DwWsL/5N+5E+SYKyJFWAQYMKZVOhjx2YCftrd+e0fv/+OFNVZw97lBMurHfCqK7SO96K85XpMlNvdn07ynuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BY5PR11MB3973.namprd11.prod.outlook.com (2603:10b6:a03:185::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 07:44:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 07:44:20 +0000
Subject: Re: [OE-core][PATCH V2] mdadm: install mdcheck
From: ChenQi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16CDBF9B1327A14F.24088@lists.openembedded.org>
 <16D15E358230A99A.14843@lists.openembedded.org>
Message-ID: <bdc482d3-e13a-7a57-d1ef-721cc8eef025@windriver.com>
Date: Mon, 7 Feb 2022 15:44:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16D15E358230A99A.14843@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------61727380793EAEDD403D86E2"
Content-Language: en-US
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3414377a-305b-4593-b6dd-08d9ea0da699
X-MS-TrafficTypeDiagnostic: BY5PR11MB3973:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39730C716190306A8CC16B4AED2C9@BY5PR11MB3973.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bDtbDaHgnrgWI8zG5mhb06uvnXMQSeUiJHoCSjvunpWR44azKoTSeaBnnkmA+H0rdGlaPLs0i8A3Tkt3wyFxbbmfF67sGsYydFXpRO1oLyMg6QiLk35Zu6APoZYqBQjDiB5112I7iYF9rFE/ZkTFd+842fspqj8XH/ec2q7K8ee6gcmSzHd8ghH/9Zeq3vkr4Ixa3K91Lp3k2ZW83lOW1fbHC7R3XwFnoxKk2l02LqPAh1E10nXPnUgykh1hVl3KdnBaAs4KbkzrCPJd6MI/e9MnMPazZc++YPfaEP/cQDswkUJmX3Jx2FmT4wOAupQXEb9h177BLtaBr2+2+FZpC/uMOMCmTrJQDpjjdRrwRbIDiGfVHJ45UK5UQSNLwqqpSreR6jFhRebjBzvJTSTAYOLWzdY5vLzlSb4nJePm16ASF4nfLMtVFNldipRkfKcMLhwczIfs5GFn04dUjRhDENEVF4nmutl++UELl6yp96wjPqUhJ05ckn1eez3hvItfT31SnxUorABuPLBN87KDNYTBsXT/1kzOql6w3xdo5zKS8I73aoniPs4WAbBVVtryQwovKbZNjwFeO7x7DvBMxnu9hGyw/sX1EjDuQ4BKRjl1EqjMBPLMKdQJq2xY8MUgz0Q0aLlKTUFaMnqcn3wyLDjyjRo+SK2dgDZGigQWMmQrflRzPW6nx74dvH7xXIL4sGheIwesfZ4XnopHcbWobF6Y786Pn9zgCByLBfZW8C8GLfvPXLdY4yHyBExHeNGv1kCXJ+RMnjY7/LcP2Cj+P/mAUC4/GEYmybX8B03XjIPKEdqOKuqjT1uSH1/6sjpNkT1zPA410dvThD+dTYtFipiD46CIb372382hQzxm3TtD2NXX64Gk0uSlVEoxa/jwQ0F4JbD1B7BVJoRvDztSbGnJYXqJcaL0LTVNfg3MPlk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(26005)(186003)(508600001)(38350700002)(6916009)(316002)(166002)(38100700002)(2616005)(5660300002)(6512007)(8676002)(6506007)(66556008)(6666004)(31696002)(8936002)(66476007)(66946007)(966005)(53546011)(52116002)(33964004)(31686004)(6486002)(36756003)(83380400001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WktwMnJIeFFqdjRSUXJnUUNZZ1d4Y0dlVW1NK000alMyR252RmpNQmJuQVZV?=
 =?utf-8?B?cStQMlp5N1hzMUFRMEVmOElZODYxMU1aeG83ZUJwMTZrMC9EcWs3bzBWRnor?=
 =?utf-8?B?Yk5LUkU2MGRxT1ZTRHJLK3hrbzBiYUI2bmhUZzN4cEp5UHdmZ2k4eG9FeTcx?=
 =?utf-8?B?OUVkUmR3N1B0b1BWKzF0eWhXYmE4SjlXNStQYVkvVXNkVEVlTmt0M2k3NTZB?=
 =?utf-8?B?cW41bU5zMHk3SlE3cEZ2Qm5YUkNTY050NHVCcnhVaHJOVzd3NVhDZXBaV3g4?=
 =?utf-8?B?bWlmL3NqY0lPU1NYUldYZW9xckZQMjdLL1htL3hOL28wOTdLMlJvSTBRODNi?=
 =?utf-8?B?a2hmNWwvMC9aNG5TRTdja3kwTkwybFJBTVdDU01VLzJRZWJESTd3UUQ4OGM4?=
 =?utf-8?B?N1dVZ1J2aWZSTnhjWXNPNDBZLzZndk13MFZhN0NkRHRzWVZhTkRoUmVpRW9Q?=
 =?utf-8?B?VGhxOTNabWZWenRzNjFNbnZOaCtCa2ZiTHJhZHhObElRTFVsQStrZTE2Rnha?=
 =?utf-8?B?N2RENEhqQlY3TnpPNitMS0JKRHJ1eTVDenlhUWpzK2RhN0taUUFuQkpYRTgy?=
 =?utf-8?B?SDhNSjVVT2dsWGNwa2sycFR6SWFRYWhyaXBxSzBUeFc3cmYrU1ZsL2dqT2Jx?=
 =?utf-8?B?VHVVTUJLYklBWVcxdlZ4eGJGQXpJK3VhVVFCZ01SelZ4NWw3WFFlOW9ZSUdC?=
 =?utf-8?B?a0xNN291aks2RlkxUk41M0lkcWZOTWM1eU5aS1NXekVCTmtveW5DVlZzVDN2?=
 =?utf-8?B?VWxUWVJOaUxlMitkbUFBWHh1bFp2RlN1RUFaTEJMZC94d0FlNTVzcjlsdWtq?=
 =?utf-8?B?ZXdDQUN1ekRYUVcwY0NsMDVQMnZmOE85YXhnYlNCWEhVRitkLys4U2VNRWRQ?=
 =?utf-8?B?bHdMbTlOYmpDVUVHdStuSStnRFFlenFXZEk5SVhPMGVSbzZqVnRlVkRyTlAy?=
 =?utf-8?B?Rk85dHhRdXNQTVdsR1lDTlhYcG9OQTBubGxGZ242NDZQeDY5VnVBR3hRSXJk?=
 =?utf-8?B?UzNXeUpGZDZUQytTRE9tVXhNSm9rajl2ZEswR0l5N1c0emJiN1cwNkRsZkhU?=
 =?utf-8?B?WnNXQU9BMlVPdFQ0NlE1MnlUbi9aVE9pajE3YzM1R0dYVkJPNlAwMTM0bmVR?=
 =?utf-8?B?MVZxK2dtd0xjZUxKUVNPY2RZYWl5QmtzVzlGNGRSeGZxRUlGVms1cTB6ODBp?=
 =?utf-8?B?TTdESE1NU3ZSeHdicEMvMVlLdCtFVEd0SDNobmJPcEdKR1FmRTFqeC9IYlk2?=
 =?utf-8?B?eFJCamhrT0RsMHFxWFdkWVY5QVhid3Ercys0N2RQYmpHZitZY0lEbC9ORzJn?=
 =?utf-8?B?MkhUUTNaYmRRUEdwZ2h6WG1yV0cwKy9WOXV6clN1clZpMndWUTNZM3NhL24z?=
 =?utf-8?B?OFFhSC9vNUdTK0dPdGdpVXJ4VFdsQVQxeXN3MnU3SkhNYTA1VDJTWVFTRHZZ?=
 =?utf-8?B?TWhpV2NoODd4QzVON0NBWVlHc1RGZmpMS0lUTVVwZ1FiS3U1bkE2Y1Y4T3RV?=
 =?utf-8?B?YUUxbFZkOVJDdExTUGZ4a05XbElRdllHc21PR0xSWkg1aVp4MDZiUWcwYVdP?=
 =?utf-8?B?R1lYWERRUXlmRDJrcWhsV3VISjN5S25nL2QyRWpZZUlKRUZoeVdSYXlYbmtp?=
 =?utf-8?B?c0daOHBJRFVkaVl5YUlkUlo3NCt1TzFCWTdYTUlSb0hQa24zcXU0T3pOMHgx?=
 =?utf-8?B?WmhSckNsNW5aempSUGlYQWNpZ2g3T2NxOWRnUnpEMlIwWUhiY0Y4OU0rVmJB?=
 =?utf-8?B?ZWFRK08wTXBHclE2Uk9OeTJ3Rnp0eGxUd0ZWMWhlQkFmc2s2czc4cExTSjVT?=
 =?utf-8?B?MW9WV0lpUitOSmdMQVRRZW10dWd4Vm1MaVVXTjlvWS9na2JkVCtqTGp0eFRH?=
 =?utf-8?B?bjNaQ3FYaE9PV1pnMGpTUHlkbDMrOU9RWGRrWEVXSUFLQU44RW4vS0xBVjhG?=
 =?utf-8?B?UXdVeTY2ajVFa0NLbzBEWE8wSzg4T0txeExoUHhQZFNRdFhGVW9Ea01iaFds?=
 =?utf-8?B?THRTTUlucDJ0ZWVpWTV0aFlDcnl5ZUtJWDZTUm5nUkZ1b052bTlpK3RCcVpG?=
 =?utf-8?B?T3hHZ0JVUElob3l0MzE2VE54Q1NnZmxVNUw1ZDdGbmF5Yi9mcEdhTFFiVEl6?=
 =?utf-8?B?azlRQm13eDVZZzc1RGwxSXMrMHFyQUdRN0NKSXZ3MUhpaC9LZFdGeFF2Nmlp?=
 =?utf-8?Q?aGQupji97AbYrHYPppS6o4U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3414377a-305b-4593-b6dd-08d9ea0da699
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:44:20.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fHg4a5+2QYaurxUsKKkf5aMl55KrHWh9km7yQRh/nmh9yVkMzkfb14ed0+ck/GuOwfoRGBqXIvDIMBg3wVHDaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3973
X-Proofpoint-ORIG-GUID: ym-0iRoS64VV1EswTyocJF2BrM55qczR
X-Proofpoint-GUID: ym-0iRoS64VV1EswTyocJF2BrM55qczR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_02,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 07:44:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161441

--------------61727380793EAEDD403D86E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just noticed this patch does not apply any more. I will send out V3 
which applies to latest master.

On 2/7/22 9:55 AM, Chen Qi wrote:
> ping
>
> On 1/26/22 2:54 PM, Chen Qi wrote:
>> This script is used in mdcheck_xxx.service files. So we need to
>> install it. Also, as it requires bash, we add bash to RDEPENDS.
>>
>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>> ---
>>   .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
>>   meta/recipes-extended/mdadm/mdadm_4.2.bb  <https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$>       |  2 ++
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
>>
>> diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
>> new file mode 100644
>> index 0000000000..3f76ef54d8
>> --- /dev/null
>> +++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
>> @@ -0,0 +1,30 @@
>> +From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi<Qi.Chen@windriver.com>
>> +Date: Tue, 25 Jan 2022 16:25:01 +0800
>> +Subject: [PATCH] Makefile: install mdcheck
>> +
>> +The mdcheck_xxx.service files use mdcheck, but it's not installed.
>> +We need to install this script.
>> +
>> +Upstream-Status: Submitted [Sent patch to maintainer]
>> +
>> +Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>> +---
>> + Makefile | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 2a51d813..db40c7fd 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -303,6 +303,7 @@ install-systemd:systemd/mdmon@.service
>> + install-bin: mdadm mdmon
>> + 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
>> + 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
>> ++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
>> +
>> + uninstall:
>> + 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb  <https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$>  b/meta/recipes-extended/mdadm/mdadm_4.2.bb  <https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$>
>> index fa51364283..e15f8aadab 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb  <https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$>
>> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb  <https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$>
>> @@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>>              file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch  \
>>              file://include_sysmacros.patch  \
>>              file://0001-mdadm-skip-test-11spare-migration.patch  \
>> +file://0001-Makefile-install-mdcheck.patch  \
>>              "
>>   
>>   SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
>> @@ -92,6 +93,7 @@ do_install_ptest() {
>>   	done
>>   }
>>   
>> +RDEPENDS:${PN} += "bash"
>>   RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
>>   RRECOMMENDS:${PN}-ptest += " \
>>       coreutils \
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161438): https://lists.openembedded.org/g/openembedded-core/message/161438
> Mute This Topic: https://lists.openembedded.org/mt/88691711/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------61727380793EAEDD403D86E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Just noticed this patch does not apply
      any more. I will send out V3 which applies to latest master.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2/7/22 9:55 AM, Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16D15E358230A99A.14843@lists.openembedded.org">
      
      <div class="moz-cite-prefix">ping<br>
      </div>
      <div class="moz-cite-prefix"><br>
      </div>
      <div class="moz-cite-prefix">On 1/26/22 2:54 PM, Chen Qi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:16CDBF9B1327A14F.24088@lists.openembedded.org">
        <pre class="moz-quote-pre" wrap="">This script is used in mdcheck_xxx.service files. So we need to
install it. Also, as it requires bash, we add bash to RDEPENDS.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com" moz-do-not-send="true">&lt;Qi.Chen@windriver.com&gt;</a>
---
 .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
 meta/recipes-extended/mdadm/<a href="https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$" moz-do-not-send="true">mdadm_4.2.bb</a>      |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
new file mode 100644
index 0000000000..3f76ef54d8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -0,0 +1,30 @@
+From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com" moz-do-not-send="true">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Tue, 25 Jan 2022 16:25:01 +0800
+Subject: [PATCH] Makefile: install mdcheck
+
+The mdcheck_xxx.service files use mdcheck, but it's not installed.
+We need to install this script.
+
+Upstream-Status: Submitted [Sent patch to maintainer]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com" moz-do-not-send="true">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 2a51d813..db40c7fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -303,6 +303,7 @@ install-systemd: <a class="moz-txt-link-abbreviated" href="mailto:systemd/mdmon@.service" moz-do-not-send="true">systemd/mdmon@.service</a>
+ install-bin: mdadm mdmon
+ 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
+ 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/mdadm/<a href="https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$" moz-do-not-send="true">mdadm_4.2.bb</a> b/meta/recipes-extended/mdadm/<a href="https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$" moz-do-not-send="true">mdadm_4.2.bb</a>
index fa51364283..e15f8aadab 100644
--- a/meta/recipes-extended/mdadm/<a href="https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$" moz-do-not-send="true">mdadm_4.2.bb</a>
+++ b/meta/recipes-extended/mdadm/<a href="https://urldefense.com/v3/__http://mdadm_4.2.bb__;!!AjveYdw8EvQ!Pvo4xUUejFIfuM77yasI_df7QI2ObcUVQge8G8AjHSp2LSOarxCWuYJ44fArbqpHcg$" moz-do-not-send="true">mdadm_4.2.bb</a>
@@ -22,6 +22,7 @@ SRC_URI = &quot;${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch" moz-do-not-send="true">file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch</a> \
            <a class="moz-txt-link-freetext" href="file://include_sysmacros.patch" moz-do-not-send="true">file://include_sysmacros.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-mdadm-skip-test-11spare-migration.patch" moz-do-not-send="true">file://0001-mdadm-skip-test-11spare-migration.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-Makefile-install-mdcheck.patch" moz-do-not-send="true">file://0001-Makefile-install-mdcheck.patch</a> \
            &quot;
 
 SRC_URI[sha256sum] = &quot;461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d&quot;
@@ -92,6 +93,7 @@ do_install_ptest() {
 	done
 }
 
+RDEPENDS:${PN} += &quot;bash&quot;
 RDEPENDS:${PN}-ptest += &quot;bash e2fsprogs-mke2fs&quot;
 RRECOMMENDS:${PN}-ptest += &quot; \
     coreutils \
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <p><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#161438): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/161438">https://lists.openembedded.org/g/openembedded-core/message/161438</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88691711/3618072">https://lists.openembedded.org/mt/88691711/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------61727380793EAEDD403D86E2--

