Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C140BC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 07:07:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.64131.1701673649599212798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 23:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0702f68f70=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B46DU6u017450
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 07:07:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3us4d5g7g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:07:28 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B472qLH007064
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 07:07:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3us4d5g7g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 07:07:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4Zvi/45v5ZXa7PrEIkpfjVm21qhH1v9zCAVjRb02cx3DtWw7N5GmU/WCQmFjKaCOB5Kb1lsnNW+P5HSv0uHHPE1h56lbJoKEsrAirXOKlKkcODKBU3YaiAyszGxQA92l6f2em33/h8I6QbDTjhv4+zIGDDBszfBGOHJfiCxmbHFibwnPwVHj9XmMCyzMw7+/F7Mm+elbfdop7ShJgstypAyNZE7LWjnwWJ2jp9bNyKCBmEseWYktAkqKt2mAYauAOTN9QB5ddY2bYTkY68cDZ7xZYvRiJUo+mWXGXGg2lPzk51N+wWhEUvGESsC/W13QjjUxwNYMy8bkizVJGB9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JQDhgIbE4NCwWWdgBpjoPl9VCKbD+77w+MrKsH4QMY=;
 b=NLLYUA8qebLq+3xV6/pB7feoqV1KmHd3LgeiRbacQ1tNzOPD4cR7/XRMk0p/GyNqUUQbqN00n9eE0bXOVXzLzL1thI9S1DXB7FYm6QKsKx6UZMKC3oCI4OcgF10N59aEA9ghzBSfVtiufdqxDWZOHBI8aBFxA5TzkdhmNm8piq6ZofZPfMi+poj39ZIGcXHftVYr38TdSigqah9TJeiJquDLPDpECFw+ZHoCtVEXAk5QkK7bjMtUFcxjrLiVKOJDgAHuzL9ggsq938a+UEzHCAZNgDitiZQ6c7T9HsRUj4P2aI2uZzejrPjZEwYSRxsbXlO7parwjVfPqWxA143OTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 07:07:24 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 07:07:24 +0000
Message-ID: <14c22f1d-0879-4643-8bbf-741ece167522@eng.windriver.com>
Date: Mon, 4 Dec 2023 15:07:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] openssh: shrinking to a new PACKAGECONFIG line
 to set systemd readiness notification support
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
References: <20231201140947.792594-1-xiangyu.chen@eng.windriver.com>
 <CAMKF1spO26_0T5i7npXaekipmO16geFyjsmXgR+OL0LE23WvPQ@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CAMKF1spO26_0T5i7npXaekipmO16geFyjsmXgR+OL0LE23WvPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::16) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a015fe8-d4fc-4355-9a4d-08dbf497aaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zPicKmiadD35o+oXdwGAhKf0zvzeLIOAzC0erM4wutED0jleLvfPH3/RAnqpXZ5uPLSRIp0rfHNiSKet2jcQ4yIF8n83VYnBlEoS7ksZT2UML92lRRD9WjcfV5x3ELXHRG+yXTqo940mq4SWba5ADdGnlOmAD/nZGC25V0qi0LSoRBzg7AXmlg0mxjemnuTxgLEaW4BOJ3ezAeZlN1nQ+A3nHXImm0PRaoN4rxnK5uF0vRszqnz2CSuA2GqajnsWeFL9KrPcaltHZilTCUwNEHJFFdDE2F1wzrnzfuJCaL8VY9tLRHM/i80Tg9zwuEBeMeBWSeYpU5ZcgqJKC/LL0tlh5YitdS1rCigux+Wca4VRI3F5zvzR7ZulTxVnqrqDCOmN3q3HnRq6o5JmEvRTuWugBOPeL7obAdT4s6HNezhiNpRtAO40i+OUjzrQxb7rEtgf0z/gXFNJqmz7YOjP0Nku3fqpfEwrSSVuqrHlmIZ53KCJ83nsqWglqb5r9LTkky7C1gunj8EFEJcQj2rg10nWpIy14rP0S4azuAfdtGW0YSPPywMzf6j2HpuSBd1b0tCLPC/+oc4NCa+eyIXovotcHfcON8m2238u3Fy2U0+XHOtPvgUlcNwcsPlEj1vEMH3tdx5roL1gUx6NnrqfQeOySOMQf8fC+X94rzTx4Lb+Q3auZSUA3NxRyZOjHrbaryRDpV6sK0FKmT+QCSklnXPSRK+RytaYaYpON2ELDbg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39840400004)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(186009)(1800799012)(31686004)(2616005)(8936002)(8676002)(4326008)(6512007)(6506007)(53546011)(83170400001)(83380400001)(26005)(6486002)(966005)(478600001)(6666004)(66899024)(66476007)(66946007)(66556008)(316002)(6916009)(2906002)(41300700001)(38100700002)(44832011)(31696002)(15650500001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2hzdUhyK2RJUzNRejM4WWl2OXJYZHVaaVBTSnJrZXoyU1drdG9uendsb1NR?=
 =?utf-8?B?LytVQkVQcldrNjlSTmM0VnllZnNuTkZJMXJoa1BPZGlUNi9kbVhUYnRLUGdB?=
 =?utf-8?B?dkRVSG0yMWtvZHk2ZWd3cXJUYVVPMlcxdzhIOVpNbFlIaWFnbGZJTlVuUFNG?=
 =?utf-8?B?eHU5b095TXpkSEFMOGZ1RGk4dFNtMUxINkxlZHU3bUdNTng0TXRGQkZITU0r?=
 =?utf-8?B?NGlOeGFReXhnMklRS21pdy9WdHlxdXJvMENQWm4vS3BSSWdDTzBkbjBlSmNF?=
 =?utf-8?B?QU9qYnQzSEpKbjBFK2NSSHpmN3QzeWRNcEZMVzN1RlJDRTVyc2NRRjd2dmlj?=
 =?utf-8?B?b1FVUUdGa3ZWdDZwZUFKQ1YxdnN5YkZLSUp5TldtY2JUQlZqa1lLSktoQTRq?=
 =?utf-8?B?eDRqYXpjckdsYXk0ZjlyYWxVZkp3QkZyOGVIc2gzMEtHTHFiYysrQlhId2hG?=
 =?utf-8?B?aHl6eHpoSGxmOExrRmJVZEU2bGNxQis0cGx1VmVXWFYyZFBwRUFVcnZQR2Z5?=
 =?utf-8?B?UlhJYlM3c0dra0VsLy9CUHljSmxDcEhVUXlYbld4MVhvS2tiOUdQQ2V2OXEz?=
 =?utf-8?B?ZkJvRi9FM00zQmxaU1N4Sk9zbEdmM2I4TnpacjVvNGhNb1Z0R0FLL1Vvblha?=
 =?utf-8?B?aW9xelA5L0ZNV1d0Y3RkRVp5S1BMVXdDOU5RbjRqZE0vVWREZ1ZXTXlCZjlN?=
 =?utf-8?B?eklIdzFoV0NQNm12NEVOb0ZRaWw1cXdLRStyczBOTDN4R2tPa1FvNVhJR1dO?=
 =?utf-8?B?TE1Vc1Y3ak51dWc3TkphTFlPTzR3UXl6UWNqSGtnb0pXeWNUUm5pOTZEUWNF?=
 =?utf-8?B?ZWdtcWJoTTE3eW8rdko3cHBPV1pzTjVtbnQ5T3c5bW8rV2FxWlZUNVdvN3Zv?=
 =?utf-8?B?UEl0dTJDQ1BWMDh4THd5c3d6dzFQcFVQcnBWbHZOamlxNmpVTW90eDNzbndP?=
 =?utf-8?B?RWV1Y0Q4NDhSaHhKQ0taRDkyb1o4djZ3aGIrRFo3Y1JCcGtCVVNpdVNheWp1?=
 =?utf-8?B?MEpRWVdGQkdZSC9JMzNHNEJFM1ZtRzJLcmhsUTMxOEhpMGhQUk9BRHV6NDls?=
 =?utf-8?B?NVMxQTZvTDljVU9nWlV4NzRPOWt3RFZINHVQWmJ2c1NIVVVTaE9aeHJjc0h0?=
 =?utf-8?B?eGlZKzlvVzF0bDFkK2JZQXgyN2ZvS3lqUGpJM1BIZ3hudHpYeCtOVTlrbzhy?=
 =?utf-8?B?dCtxSFB0TElYMzFHeC9Qb3FRRlBlSStSait5OXFpVXRYSVZkZXY2bmFOaUpj?=
 =?utf-8?B?ZXhIMmdLMjJ3RlBsNzc5OEtPK1dudVVTNXRJN0lvQ3pSS3BzcDN3RFVTUVNU?=
 =?utf-8?B?ZGw2QVdUUXlhdzJZMUFhSGhxMHJSQTdIWGx1YVU1YTVGTzBXQXZZUUU4SHd0?=
 =?utf-8?B?QVV5TE40QS9lMmY3R1dzQ0w4bDhLNkZRbHQ2OEpDNk91R2VGbG9yaHdxR1lY?=
 =?utf-8?B?a0N1NW93dzBtNWpjbmhEV0s5cVJjd2svZTVrekh5T2tLMkhaSDZReXhsWGlt?=
 =?utf-8?B?KzZFVDg3Wmt0VE4ralBqa2tDWThqeUJPRVpSWlhjYTYvVE9YbTJZamd3Y25k?=
 =?utf-8?B?R1RpUjlVUHpmS1NlNTY1QW43K1Z2bE9Ybmlvd0hWemxCWEpnc3JCZjVzZFA5?=
 =?utf-8?B?L2Zia2xpS3FkYXoyNG5YZmltdGpWemprVHJEZ1J5ZW02SmNSSVJyVEk0dXNX?=
 =?utf-8?B?alZHaGtNMWpkTFVoY3hUcGpHdHNsV0xPNVkwMzI5OHBvYjloZVVLaHRFeVRS?=
 =?utf-8?B?MjBWa1pwcU1oY2dGSmNjUTZyalp5bEhlc0xEQ0JIcGNyY0JCdkJxbHlTTlFn?=
 =?utf-8?B?RWs5M2dYeW1KRDFIYnlpVUlZMzR3bFBPcC83ZXZEblUyMW8yaWd3b0lORkxS?=
 =?utf-8?B?RlljcnJIdlVic0p4V281dlR2WHp6TlRuWlA3QitaUit4OUp2cXlPb1ZSOHRX?=
 =?utf-8?B?Qis2UzFGbDJMUDFTcVdNQ3BGdkx3Uk8yRDF0eDRPVzBuNHJjajZTQUNiNjNh?=
 =?utf-8?B?c2F3b0pQZ0s5REdWS3ZXUmNwVnIxbXFQR3J0cHZ6U2MxckxUOFp2bmdWYzMw?=
 =?utf-8?B?V0Rsc0Rlekg5N040TTRaTHJTMkpYaFM0VDdOV2R1d2ppdFRqc040dWczZkNN?=
 =?utf-8?B?TkZaU1o4eHNGVHdaUFI0VGM0VWtjclNjZ3hNWkVOd1cxaDR1TmxXdzBIcml5?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a015fe8-d4fc-4355-9a4d-08dbf497aaae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:07:24.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0AlBHgg0GtGLmRsunSG/EmkPp7MCWxubAAEJWMeyaSHpivuKVd5af0M47s3T1V2u7J8qQ/9Cc0OEsTMkx13gWDUHZRHNUbJ8jutQ9LDpG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
X-Proofpoint-ORIG-GUID: hTiAO4m0j2tPOqc54vB5l98zgbM2th23
X-Proofpoint-GUID: fHzuviwPg32gyxC0poBLWMgqg_LiZ4Oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312040051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B46DU6u017450
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191724


On 12/2/23 02:53, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Dec 1, 2023 at 6:14=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Using PACKAGECONFIG line to set the patch of systemd readiness notific=
ation
>> support, it can make the .bb file more clearly.
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   meta/recipes-connectivity/openssh/openssh_9.5p1.bb | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta=
/recipes-connectivity/openssh/openssh_9.5p1.bb
>> index bbb8fb091a..2c1c821ea9 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
>> @@ -53,13 +53,13 @@ SYSTEMD_PACKAGES =3D "${PN}-sshd"
>>   SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
>>
>>   inherit autotools-brokensep ptest pkgconfig
>> -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'sys=
temd', '', d)}"
>>
>> -PACKAGECONFIG ??=3D ""
>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd',=
 d)}"
> This makes sense if someone would like to disable systemd support when
> using systemd init system
> which does not seem very likely. Is there anything else other than
> cleanup that you are targeting with it ?

Ah, yes, this commit apply other thread's comment (oe-core maillist=20
#190593), due to that

thread was filtered to another mail folder, when I read that comment,=20
the patch has already applied

to the master branch, so I create this commit to make a cleanup.

> If so, I think the status quo is better.
>
>>   PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,kr=
b5"
>>   PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
>>   PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit=
"
>>   PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-mantype=3Dc=
at"
>> +PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
>>
>>   EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
>>
>> @@ -71,7 +71,6 @@ EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/lo=
gin' \
>>                   --sysconfdir=3D${sysconfdir}/ssh \
>>                   --with-xauth=3D${bindir}/xauth \
>>                   --disable-strip \
>> -                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-=
-with-systemd', '--without-systemd', d)} \
>>                   "
>>
>>   # musl doesn't implement wtmp/utmp and logwtmp
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#191666): https://lists.openembedded.org/g/openembe=
dded-core/message/191666
>> Mute This Topic: https://lists.openembedded.org/mt/102915607/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

