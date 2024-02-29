Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A53C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 06:43:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18768.1709189022390441015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 22:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MLhlV+e7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37893041e6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T5e2Ln002685
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 22:43:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=H2/NPmrtxFb2npUZnp+N1eRgVfSubfLygzcgkEJ6ZmY=; b=
	MLhlV+e777WRpGwT0GDKbrDJWdjcG4zljT4vWhEwel2iH45PG7VMpfKOSqUx8mMD
	06JH8nSBJwrJ+HkY3m7sWoFMh4BLDsdejrvWZsFMy3L1Ua6N7O3Oj9589/gP8quj
	DSUF8sZE3BEU8VvNweOXQ7e+mkOisTATDtTib+nMKWQa0iccS0ONWzwA4VgJTDlp
	9TICU3tAEXhfiZGgYPZXO2hnjWPi/SRUKmW1zYHnLQGobw0iDuAPwb8ZrZkAaTgv
	5Z8rH797RNowwxOh58FrdxA9USVe2IzH37QhGJAbxj8uJrE/+FQurRUv+IBCqNIE
	wzejcgtl3F0EdXFjubSBDA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgummt73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 22:43:41 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41T6hfVO024880;
	Wed, 28 Feb 2024 22:43:41 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgummt72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 22:43:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1XAorkaiiVnhsPRjN6AMzBYXV2dodmMrfHAjqbhk/1V+KV+wEgU4j3VqwNNUSrnlZKHnDTr7i2FDZmUZJOqpQPM4fAC9+QB8h+MoQ4gaBPLETwuhtyA+05fxUFeKhlM+boqOPpFzZa6ItOpIhrUVyVpDaZfla25zukdEhpv63m2NboeU7Bn7spifBboZsk6MuqFnfNwhTejaP1wXf01mxHNuYhicleOpHBsku3YkHbuiJB3AamRM5PSClLsR57zb+jFqAKfITAt+1eaFGQWhsnVOy04psgDRRpATtYc0EoMLn4ZaTrOXQdEMYdXBYdH7FLAHgXEjaDzvq4rcAcIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2/NPmrtxFb2npUZnp+N1eRgVfSubfLygzcgkEJ6ZmY=;
 b=i/NLNSZttiZcMI3Kp/G27yGtgt66GzHUUuMEbiOwWTPwwTghbRFTx5sMk3aHAGzseNL7INdzONMsR4pjtbnbpSX8yI6QO9Uf8mVU+hF+j60FV/V0AyZCIO1tiob+gRclCQQrzq25Mtjnyc3J2T7Wf8B3gNuMdalG3VxfJJxwZdorQZHTyUsw6cO6XG7/n0H9rdUTdhFmVfCTCrRp016Z7GJ4XZpQ9wqSVDdAtA7FL2LZlDyg8nh8xmitnDjAk0+O7gb0VEL2RyiFJF8HP7Hs9ZEJwtuhpB+l29aJSY/jSGXqs0+bpZ3M1ve66owbjKTVY9BwHdGhx1q9HwqSHEFwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 06:43:38 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 06:43:38 +0000
Message-ID: <c19cc481-ae19-4b25-9248-cd9faa862026@windriver.com>
Date: Thu, 29 Feb 2024 14:43:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com>
 <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
 <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
 <CAMKF1sprdSK3FZuR+MeQX-pvWaiVKsoHG5fmEmd6n7so+6NM3A@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1sprdSK3FZuR+MeQX-pvWaiVKsoHG5fmEmd6n7so+6NM3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CO1PR11MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 734b6213-bbf3-44e6-ae38-08dc38f1c28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ds9djFITHOiW4NfaVe6XDozR+DP3lUK5167n/BUUIcdunXzYCkpfK+pGwANZh3YsNjhQEtRM/Y5kbigvNHAmJnAtlq5h9daDbRSro6di0IqoT10/06ijEoSLrYWC8Q2ypM3IaD5YBnXYt52H6ciYldolRgLf/HTvc/t+0sqSKvXos5ZnjwkvNoXeJiAt5zTDUxh/V4OKoY3dKCAer/rNMmi4r+8aOr5/VGDZ6RQ6O5+xlqI1ixQgAtgxSyHhiGI6RIAaow7dC0Q3AdjeAz7vveJvLIsPfHpV7nS6jkuLYZ4RO+66LpHcendlPAp1HFEwWbpnHN1yk44xMXwIhwW9ZLmWJCrUTl6ayG21cn4JpqdMz/YNNKZGfTKg7TJtr1S+56UwTD4zX7DN6E4cJ4oP3YYx813alu9Tv9ct4DLjyQi0GJQBIYYhKCHdJQnqCZjRiOaSak+cyIrx3rZ0QOuPo45FuB+I8WeYh6+N3WrHnc47wDgQe+dRWh6HbOGgJ8I6+xD4s2FzhRrp5qAFKUaSW1it9BRI0x3QDJdmIjnqmParAMMR9FHcMKBGtgrD6EqhjQwiH+1tpWZgCf9lIjU3Cw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjFzeXd3VkxoMVlDL0tXSFpRSzJ1dmlDYmhDcUdRNDhoenRTRTQ2R3VnemVt?=
 =?utf-8?B?YStOSDFqdHNoZHlYWDB0T0dSN1UybGRTYVBjc0dwd1RncTJPMnFsd1dUTjBq?=
 =?utf-8?B?K3Nzc3plK2crRXRreVdWdDBOOEh2TDVjQS9vVzVmdVVaZEVYVUt1SjhMZFFy?=
 =?utf-8?B?TUxicnY4R1pHUmR6Mk5oaWZqQ0NTV25qQkV4eUpjdk4ydEhISU5jTWNtbTRZ?=
 =?utf-8?B?QXpuSWh4ZU5KeTBrYy9RaUdacUwzTU5GOVBNVy9DMTFUdkFuU2gzZDZmR2Z2?=
 =?utf-8?B?WldEU3ByOW9yQ2p3TC94R01qYm9KZmJXNHY0UUUyTEhyK2FhNHg1MGk5eTVs?=
 =?utf-8?B?bFAyZUtuOGUrY0ZkenlRalFERG9XSTgwTXJmQUFuTk1EN3FDSU9KTDZDZ0Zl?=
 =?utf-8?B?WWFIRW9qYmRUZUYyUXFWOUEyQmJmdWxPL3NoQmNqclZIb1daaytqbWdTbllw?=
 =?utf-8?B?T2hBR2dsNWljV2VCNWhqb0NxT3FrNTYydFlZT3JVNjZVNTJka0ZOdVoyWUl3?=
 =?utf-8?B?blRONk1XM0RtdStyNnk2aW9TK3pPV3RSWlF1ZC8zTVlVTGRwNEZ5eVpyWWpy?=
 =?utf-8?B?YndQY2JTazZCY2twV0VJQm1qT2l0WEhaWGVXVCtyYndTcnVWb2NDY0hIbFph?=
 =?utf-8?B?K0VVbEFJOGZUdmRSK3BWcjFXL3hUNXpvZzAyK0FxZUgyeDFrcks2M3oyYnlR?=
 =?utf-8?B?cEtMQ1RIRXhRQW1JM0FoQ3dXTWFXa1Y5MFlMUEhqVDc4Vi9LTVdTWmlDN1hB?=
 =?utf-8?B?b3NyeFJCL0V3Qm4rUEg5OGNVNHUyMUdkMFg0Ly90T1JIRnFEd1M0RDBETlc0?=
 =?utf-8?B?WWlmUFgxUTNwcTNvcTN6cDlEb0MwUW5EZjlnM3dsTEhDNEYxaHBQbTVpb0JW?=
 =?utf-8?B?c0xYcmVnUHpxYm5TWWNRS3pIRDN1MGZRaDNacE8zUUgrdXpWU01BQnVzN0h0?=
 =?utf-8?B?b0JyOUwwZWMzQVBMNmhwSzEwcFhLL2U2dzZlUVk5czBOOHVKaVRTWmdwbFlj?=
 =?utf-8?B?Wm5vZFErYkdiZEdTbjdSbVFDVXJVeElhVTd2STVxYlViL3Fvb3BUREk4ams0?=
 =?utf-8?B?cEpjUUxCVXYyVGNiZ3o3THlhdmFodDQ0em9JYUhNVnRUblY3bXEwQ0hjbEpJ?=
 =?utf-8?B?YWhkRXJYOFNKRlQvNDIyb3BEa05TZHNtZ0FxZDVhaUlVT0xmL200RXVsQjcx?=
 =?utf-8?B?T1JEMUhkdjZnVHk1VnJQdlNkRlo4SHB0dmJTc1NqcXp2OW9xY2FZSUtVSDFN?=
 =?utf-8?B?OHdzek52aW9oRWgrOFlkMlY2d1BzSjNuTE5SUFN5U0hSU3BkVXlySkJzWUNU?=
 =?utf-8?B?WGdUdlFwVEl1cENnY2VxNE5RdGlFSFBiTlBuTTRhVXhXdXNVTEtwZFAwRDgw?=
 =?utf-8?B?bzBDRUFiNVlmUzZaNGVxVFFzcGYvSmhVeFJ6MTQrOGRrUFBxTWhPTllrenRF?=
 =?utf-8?B?K3Z1bVVJRWlialc0dzU2STNPOTVsZ0FVNWxHTUlTZkY1R0JvbGhpdVFjdHNh?=
 =?utf-8?B?VTNyQmozYUJjVXhwYjFJejlvdlNhK2txTkhCdGZzWExLaGovZEdkanJ1L0lt?=
 =?utf-8?B?WUJRanNpVWE4YmczNUFDak8ra3VrMUhPQXBhN1NDbVJHcXVoVzdGdE1yVkZa?=
 =?utf-8?B?eHdNYnI5WmVxb01PdkZXZFd3ZHdQVzhPbjNwa0U3bmprallaMENlR2hjMHFu?=
 =?utf-8?B?ZkZ3NjFuKzZET09LTWFZMTJKNXNsdkR6QVVsLzI0aFM5MXhyTWtWVFRaeHo4?=
 =?utf-8?B?ZGZ3SlFPaGtRRmdWWXhLbWNvUTNNZE56UlFrbm16ZVBIaVpiYnNUV0QwY0U5?=
 =?utf-8?B?SXBKbHcxLzlzazhlOXhCaHVTdlltVWlQUGJKZnRoKytZZnFBUWpuODlkdWgx?=
 =?utf-8?B?VzdFRFF2elE3eU5uQ2N6ZGgwT1BEVWxsNmtjY2RCbEU1Kzl4V3N2ZlA0QWdn?=
 =?utf-8?B?UWx2V1VPYUJ4a0R3UGcvUEZaNEYvb1N6WTQwN21Ga3BqMHRMVmhpT2dodW1h?=
 =?utf-8?B?eDVoZkMwUTNNdDU5OG8wS1JjMFd3WlZaNC80b2JMUHBIQ2pwVHFJODR5T0Vq?=
 =?utf-8?B?OWgzeEUxTWFYRzlzeGlKTjh2allBRGQ2YlhhNmlOaUFMd0VydCtwVXF4RDdC?=
 =?utf-8?B?UVZwRjErNUliN3cwcVJQeG9oSGJoTFdBZ0V3MVdPVmxBUDFLdy9GTVBSSkxq?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734b6213-bbf3-44e6-ae38-08dc38f1c28e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 06:43:38.5179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btPQ3cbyTSE7BKXCV/DAorpGaVo3++EUv8E3PMHIH/teC+piUWp/hUusqvLmPtzT80kEZM8goX/V823uStccawQkxDvW5aGU/uX6vF+5iOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-Proofpoint-ORIG-GUID: 42ly8HjJLpgIVPsDOroxRyXe1Ao8FD9b
X-Proofpoint-GUID: uXFZwi0nPu7leaEmLKQkGmeaQDbUhGPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402290051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41T5e2Ln002685
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 06:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196416


On 2/29/24 14:04, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Feb 28, 2024 at 9:56=E2=80=AFPM Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>>
>> On 2/28/24 17:45, Alexander Kanavin wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Wed, 28 Feb 2024 at 04:19, Changqing Li <changqing.li@windriver.com=
> wrote:
>>
>> 1.
>>
>> Currently,  There is one line in /usr/lib/tmpfile.d/legacy.conf(this i=
s in package systemd),
>>
>> "L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
>>
>> This line will create an link to "${datadir}/doc/systemd/README.logs" =
during boot,
>>
>> and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So t=
here will be dead link when systemd-doc is not installed.
>>
>> So that's why I create another legacy-doc.conf packaged into systemd-d=
oc
>>
>> Then legacy.conf and README.logs should be placed into the same
>> package. I would suggest that README.logs just goes into main systemd
>> package. (the other option is placing legacy.conf into systemd-doc,
>> but that file is not doc-specific, and should stay in systemd package,
>> especially if more entries are added to it).
>>
>> The solution is also good. But package "${docdir}/systemd/README.logs"=
 in package systemd may make things more complicated.
>>
>> since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and  FI=
LES:${PN}-doc =3D "${docdir}  ...". we need to adjust the sequence,
>>
>> and may have influences to current list of files and directories that =
are placed in a package.
>>
>> So maybe this patch is more simple and reasonable, and will not have o=
ther impact.
>>
>> 2.
>>
>> The symlink in legacy.conf use relative path.  but for oe, when VOLATI=
LE_LOG_DIR is true, /var/log is a link to /var/volatile/log, so
>>
>> /var/log/README need link to ../../../usr/share/doc/systemd/README.log=
s,
>>
>> while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
>>
>> need link to ../../usr/share/doc/systemd/README.logs.
>>
>> After change it to absolute path, checking of VOLATILE_LOG_DIR is not =
needed.
>>
>> That's ok, but can you make fixing the path to an absolute one a
>> separate, second commit then?
>>
>> if  use solution in this patch,  it is better they are in one commit. =
 I can update description more detail.
>>
> You could also explore using -Dcreate-log-dirs=3Dfalse via EXTRA_OEMESO=
N

Thanks. I had do some research about turn off CREATE_LOG_DIR,

if turn off CREATE_LOG_DIR, " /var/log/journal/" will not be created.=C2=A0=
=20
By default,=C2=A0 VOLATILE__LOG_DIR =3D "yes",=C2=A0 this change will hav=
e no=20
influence, since we will remove content under /var/log.

if VOLATILE_LOG_DIR set to "no", the current default behavior will be=20
changed,=C2=A0 log will saved from persistent=C2=A0 to memory.=C2=A0=C2=A0=
 our default=20
Storage set to auto,=C2=A0 if " /var/log/journal/" not exist, the log wil=
l

save=C2=A0 in memory /run/log/journal.=C2=A0 Refer [1].=C2=A0 So I did no=
t try to turn=20
off it in case current default behavior is changed.

Refer:

[1] https://www.freedesktop.org/software/systemd/man/journald.conf.html

//Changqing

>
>> Thanks
>>
>> Changqing
>>
>> Thanks,
>> Alex
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196414): https://lists.openembedded.org/g/openembe=
dded-core/message/196414
>> Mute This Topic: https://lists.openembedded.org/mt/104598170/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

