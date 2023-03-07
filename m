Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BD8C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 19:05:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2909.1678215898005022903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=VtzhootY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2430ece559=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 327DhBQo025942
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Mar 2023 19:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Hen+zODjtbf6/vIgQxn9hbZGi670FqOLskckx5fYiME=;
 b=VtzhootYBRGsN17AttKuW3XmsvZn6dNCxBRimXhhOuXE/eeMoIUwbOLhSK/uaC1/HOrl
 HHKlMdXTK4TKXErHN6wxs2fC9ZLnGTfDIc1kt6SoQHePRUeE4FGsua7IgZw6L0EpyuJe
 GjhG3IXDVHjAnylK+6wxXQ7ab/6TsXxPenExo+M4zllkt5BCiHWmGd5Mitctz0+0l0Ka
 qF/sdA5GJYTeDrPO2uM+BB0Gj96TJz/6uIHdCNUKTBmYA929nTT+OwMREz9CMCJeHQi2
 WDfyR3dCu80PiqWa0J/UKG1136pjqjxlH6DUmCO1Xp+u81XARFXrxjbPHkAGfK2pEOLd Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p3vyabfsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 19:04:57 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327J2mW7025350
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Mar 2023 19:04:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p3vyabfsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 19:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoLDI6xSixoHRa3W00KUfPG9BYGqtuXppyR6QnwbmkMa9YaU8Ap84BK6kKTsbnHBrsMc/rpuTM3YUzjmHp4ZA4KgY3rFSxNV11A0m++O7HgqfyP3yN52FMVUW8cpJHWr7AfzRWZNcXygQ75Su8woFK2a2MdoFw53f2O5/Plwt06rOPmoqKmFMjF9VbHpLynDobRXNOLrBn2RubqivUnB1ZB36dEM8oQn3qMvSJyaanq6XJznHRIKVF+1N8SmvfLftAHslntIbw3uZ0aGoIVnGV/lcfHx7LAqUR/CE+ZeC3gJbHxnhbj/n1c8iSfoBiDW+3OdSyYbNenJpEUIbLk3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hen+zODjtbf6/vIgQxn9hbZGi670FqOLskckx5fYiME=;
 b=XJOlTVrEyPFYpKv7S5+E+JOu8OtbinraQJ8Tq5cTMVQ8lQthBj4ZyOlC2VLBi+5dPAzymCpetNNIws2HS41Rz8WrEHlbQ13uij1aPe6plpo6yNuh7SGtDsZ5J5NYkGq2GeDc+kefzIGKXZNN2PruEvliAH6Q7u/BljFCLcEQV8W7aKe0ls1RnRZ75yk29ldJibuk93HorcFv+64KaLCXDobiO3PRFL2CYVank3traOF6USqQk8tfIBOnVaQ4FE8MST9jcpGjMy1X23oSncjU85CSoLsj2VjDU9oLhleXf/Fdn6+smCWUvL92f5Zp/W9Djr9ZLZ5RPuitImI4YOdguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 19:04:52 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4%8]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 19:04:50 +0000
Message-ID: <b0a4bad5-3c42-5b61-497d-4e2c9a74b828@windriver.com>
Date: Tue, 7 Mar 2023 21:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot in
 manifest != RECIPE_SYSROOT
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Ovidiu Panait <ovidiu.panait@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
 <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
 <1bb2511c3505e7d215e74fe3aaffe8d7bbf51976.camel@linuxfoundation.org>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <1bb2511c3505e7d215e74fe3aaffe8d7bbf51976.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR0302CA0015.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::25) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|PH7PR11MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: c8613c9f-ca39-4f52-2377-08db1f3ed387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wOfqirP7marPZ+CsmA4c1qSdSFZlyXPy+FQKvKmfqaBLij7cCZtaMJkDXn1ucKQP3K0iy3s+RU35udBOBnL259LMmyNrhaBWI/czRrQz5N2pkXL6UsAU3BHsNUUTpeSrYAHIgvq0mnvEjJtBpIoltV3ENtRAqlz5YN1nI+y67W5XsykK71OnBn6K1DlPPFDJPoqmQBXC8OnxvhDnEOxt1RaARkqEvFKkXLl+0gC8oKePbSY3DVCbpw+K5YPzcL9Amtb1NVCGt+puBqxPZ6jiYP5Ft4bf/yLh7hmJUdhSEKITovC5YrtHzapNePQuKZmQZtCfVCtu2xVg08GJjYlJAhpU6AFnFF/niI6sGwSfRPF6GxeswJUHRK0rjXAN5ATQp2m0ohXGzdX5thYvhUvXrcYDs1gUBNe7lHVolQX+CLNQP7AxOoE2ooF9c0Mc+XLvQCgqsVjcdry1UNaOvxBnYLDA6dLnRoCnBmYbOihbpDqTRtYAPEP3JcdoDxVc0Tr+zIYQpwxUQL/06nG+1v8JLapzuzImqjznUWCJ6ARyDUmcTSIVCLQT2TneM8huyAwWozeCmuLQ+MUz6d1ePD6xisV7kV3CVbn5g24nxkUA9tRy84qC95i+eieTrjgZIMcmbM4uK2Qj2q/R0EZfV6MlB8T+NqE1eapr16+O/OmSX+IPc+FFSCtYloHqD5FwfUvbeCH8+cRM4wOahSAg3mGU2DF5rSqSVe+X2klh2WID/juti3JfTBi/BEPmOMY60HaM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(451199018)(31686004)(36756003)(41300700001)(8676002)(66556008)(8936002)(44832011)(2906002)(5660300002)(31696002)(66946007)(86362001)(66476007)(38100700002)(6666004)(478600001)(6486002)(316002)(110136005)(6512007)(6506007)(83380400001)(2616005)(186003)(53546011)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVpxajIwVW50QjBLd0dzKzlzbW9CMGFyckYzR3pKMkhxQnozTkZvTnI0M1dE?=
 =?utf-8?B?TkxLbVpsMERqbE1UNHRFNW9nS3k2U3Zrc1JrZElYb2dQdWZlM2ZFTXNic0tn?=
 =?utf-8?B?Mmw5RUdZb0M4QlIybVBCZTVaS0ZPWTNFVmRhQk1EbXl3Vzg1Q29jME4wVWhX?=
 =?utf-8?B?MmhZNnRZdmhpQnIzdUlJZjdRQnRNcUZCMHd3RXhSZVJuSXNyL0dwWW5FUzRH?=
 =?utf-8?B?bzFHOEJHOWZJeHMwWEcwdGNDZVhFNnBDWFB3NjgyV0NvcXJMbFRMNEdZSjJO?=
 =?utf-8?B?MURCeHh3bTU1MVV5UGlXQ25hMGpadHpLSFR5VHhjb2ZjelRndkxaQVdIT0lO?=
 =?utf-8?B?Z3VJSkdRSGlES0grUHcvVmtXSFAzc1VLTUc0UWxUS1YvMUNwRHJqa3NIaFlT?=
 =?utf-8?B?Y3AzWlcyWVNQdXdwY1V3MFM2NkFwekFCTW9BNXRWUVZMNm05VlYyRnNuTFFZ?=
 =?utf-8?B?RUloNVBzQS9uc1FSbVBod0o4Z2RCbHJ4V2NtM2F2MnV2NFo2R0t6eVlScHgr?=
 =?utf-8?B?ZWtkY2hoOUZOd0xqRks2ZlF0dkUreTMweGtGekZqSEQ3MnhIWlFhNSt0SXQ3?=
 =?utf-8?B?SXM0QlVGWlhvajF3N3RZaTZvM2lsVFZ6MHZNOFFITHQ3STM2NFpOWnJrWjY5?=
 =?utf-8?B?SlhVTWprenduZnR2L3ZkdlM3TUllaHFNZS9NSitjbzlQbHVhc25ZRkd4N3Ft?=
 =?utf-8?B?bEJnNVNxUjBSUXliYzBoZ0F4QTBjMk42NzhRYXQwalBtak5TUnN5aHhoVTM2?=
 =?utf-8?B?SzU4aVpESGViVnl5OVRqY0VsbWpPYzgrMzFrWWZrRERyWUhwSzBhWXhuVkNp?=
 =?utf-8?B?SDlwY3I3OXQrdzVaVUpsZkhMamp3N0lKdG90cXF3aE0zcEpOV2U2WEhyd1p1?=
 =?utf-8?B?c2FQcEpDamxOTVVPQktacnJuL3FTTG9Cc21ENHMxNlgxQTlraHVVSkg2NGVC?=
 =?utf-8?B?UXZOQjMxRDQ4bGQ1YWFwM0wrRmUzTDdZdUQvcFNnUUNUZWdOT0xXOGRSWE81?=
 =?utf-8?B?R1UvZ3lkTWl4QkJ0T2kxa0NXOHdIYVJtcUVhbnBDbC92dzRGOGFNM2RWYzdC?=
 =?utf-8?B?OWZmSzNOT2REeTROTFRyOTMyY2FsQkF0UEI4Y0FBYmNMVDRieVNBcmJNNUx2?=
 =?utf-8?B?K0M3d3pnb2k4NzRBWlRpajBrWmt3UWRTbGg3T28vQ1I3VS84OGw2OG9QcGRM?=
 =?utf-8?B?czExM1BBUzZQQnlvdzRVeWNJWS9VTjhPRWdvUkFjV1NUZFlHcStVUUxwODRE?=
 =?utf-8?B?MzhKc2tpaTFzVmNGTHdPSVlkTHBLNzdtOW45Z1htR2FaOFE1a0czLzdYWFE3?=
 =?utf-8?B?SlE2WDFUeEJMaFpnaVplclpTSXFvUVNKbklHU1ExUFNKa09iUmRhaStGa2d4?=
 =?utf-8?B?aHMrSWdXRXNwb09rZjhaYWc4RmliZy9zdVVaNnVrTWtDNkJQMlg1K1kvYVFZ?=
 =?utf-8?B?eVczR1BpSG54Y3h4RGpneVlWcmppSEg4SlQ2YURVKzJxb3Jsb0twWW9RcG1w?=
 =?utf-8?B?cmp5QU9KSEltdi9IWXdmT1NQQ0NETXloSHhWRGtjdnZ0WXV1dzlTM2UybDdq?=
 =?utf-8?B?NVNFeGZxVUJuSXprNHVzeFluVmxORm0vVDJCaXVCNWRya0duZmlyWWZaazVL?=
 =?utf-8?B?bnUzMmVoTVFyY0VxaXhUV2k5dTFPbW1Rc2tWa1plaTM1dTZRY3pZTzRrY2lw?=
 =?utf-8?B?VmlyYlNMMDJ4WTA5MjdaaEVNaW1XLzd5dUJJcXNHMkdxcTcxN0R1UzBxek9D?=
 =?utf-8?B?SzdpbERxZms0YjV4YXgrVDZHNFVXUm05ZHlCeUFybk5QUTVDZHRlWFY3N3Zy?=
 =?utf-8?B?aFJZeExpcTFOeE11a21kRnd2ZXg2c0ZqTlUyNndwbFU5UCs5T08zalY1MEhx?=
 =?utf-8?B?clpWdzZWRythdHYrMHVMQmg5Q05ucGJHcXdOdmZuQ3JFVy8vekR6ZXFYU0Rr?=
 =?utf-8?B?b05YeGtGZjcxdUFiYTkvb1ZGYTd0UnkyYTc0dGpZQlNkZThkN2RxZGxMYUtJ?=
 =?utf-8?B?SWlzRVFWWEpSUXd6SWFpcTlJVllPNldzblNKWTBKdDhRL1BvOGlmYWk5K0FN?=
 =?utf-8?B?WDYwUW45WjNwWHlFL3lOTU9sRjYxZjdwcFN4elBoaXVKSks4VThJZWk5Z3N1?=
 =?utf-8?B?MWZRLzI3OEVkR0FNNjh0a3E0M3Zwdi9ZZjlCWnBCMGdPOHpLYVhsMXkyTWxh?=
 =?utf-8?B?VmxpcGRUOVljejlIcUZwdjE5a1hqbUVzU0d5ajl4cXJYaW5RcEdXeFplR29P?=
 =?utf-8?Q?+D4qF25JPonqsMH0n29RIiOAGBP9s64lpVGEjGqh28=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8613c9f-ca39-4f52-2377-08db1f3ed387
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 19:04:50.3308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmNl7nny+DX9IPa42BKHMelxBo7EHPaJONXgb/C6ObWphlxkODQuVni+RSuGiYRAvo835JzUKA9rsLQQchGNsK7rxarkmypf+EVlqTk+yBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
X-Proofpoint-GUID: JI52uru3b7veTIjaPEISRpB0wMmDb3_a
X-Proofpoint-ORIG-GUID: qnxiP_3G6IhI1ezbfgu4xn51X0EGGCXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_14,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070169
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 327DhBQo025942
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178118

Hi Richard,

On 3/6/23 19:59, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 2023-02-27 at 17:42 +0200, Ovidiu Panait wrote:
>> The following scenario currently fails:
>> git clone git://git.yoctoproject.org/poky
>> cd poky; . oe-init-build-env
>>
>> add to local.conf:
>> require conf/multilib.conf
>> MACHINE =3D "qemuarm64"
>> MULTILIBS =3D "multilib:lib32"
>> DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
>>
>> bitbake gcc-cross-canadian-arm
>>
>> update local.conf to force a rebuild:
>> GCCPIE =3D "--disable-default-pie"
>>
>> bitbake gcc-cross-canadian-arm
>>
>> Failure log:
>> The stack trace of python calls that resulted in this exception/failur=
e was:
>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module=
>
>>       0001:
>>   *** 0002:extend_recipe_sysroot(d)
>>       0003:
>> File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, functio=
n: staging_copyfile
>>       0160:        os.symlink(linkto, dest)
>>       0161:        #bb.warn(c)
>>       0162:    else:
>>       0163:        try:
>>   *** 0164:            os.link(c, dest)
>>       0165:        except OSError as err:
>>       0166:            if err.errno =3D=3D errno.EXDEV:
>>       0167:                bb.utils.copyfile(c, dest)
>>       0168:            else:
>> Exception: FileExistsError: [Errno 17] File exists: 'poky/build/tmp/sy=
sroots-components/armv7at2hf-neon/lib32-linux-libc-headers/usr/include/as=
m/byteorder-32.h' -> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/=
gcc-cross-canadian-arm/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder=
-32.h'
>>
>> In this particular case, the paths in lib32-linux-libc-headers manifes=
t file
>> are prefixed with lib32-recipe-sysroot:
>> $ cat build/tmp/sysroots-components/manifests/lib32-linux-libc-headers=
.xxx
>> lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
>> lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
>> ...
>>
>> When gcc-cross-canadian-arm is built, the actual files get copied to
>> recipe-sysroot directory during do_prepare_recipe_sysroot().
>>
>> Because of this mismatch, on rebuild, sstate_clean_manifest() will not=
 clean
>> the files in recipe-sysroot, but will instead try to delete the non-ex=
istent
>> files in lib32-recipe-sysroot. This will trigger the FileExists errors=
 later.
>>
>> Add checks in sstate_clean_manifest() for this corner case, so that
>> RECIPE_SYSROOT gets cleaned up properly.
>>
>> This fixes BZ#15045.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
>> ---
>>   meta/classes-global/sstate.bbclass | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/=
sstate.bbclass
>> index af93546b04..edf5c7fb65 100644
>> --- a/meta/classes-global/sstate.bbclass
>> +++ b/meta/classes-global/sstate.bbclass
>> @@ -529,9 +529,20 @@ def sstate_clean_manifest(manifest, d, canrace=3D=
False, prefix=3DNone):
>>       entries =3D mfile.readlines()
>>       mfile.close()
>>
>> +    recipe_sysroot =3D d.getVar("RECIPE_SYSROOT").rstrip("/").rsplit(=
'/', 1)[-1]
>> +
>>       for entry in entries:
>>           sstate_clean_entry(entry, canrace, prefix)
>>
>> +        # The sysroot directory stored in the manifest file might not=
 be the
>> +        # same as RECIPE_SYSROOT, so the real sysroot will not be pro=
perly
>> +        # cleaned up on rebuild. Handle the cleanup here in order to =
avoid
>> +        # "File exists" errors during do_prepare_recipe_sysroot().
>> +        manifest_sysroot =3D entry.split("/", 1)[0] or None
>> +        if manifest_sysroot and manifest_sysroot !=3D recipe_sysroot =
and not manifest_sysroot.endswith("-native"):
>> +            sysroot_entry =3D recipe_sysroot + "/" + entry.split("/",=
 1)[1]
>> +            sstate_clean_entry(sysroot_entry, canrace, prefix)
>> +
>>       postrm =3D manifest + ".postrm"
>>       if os.path.exists(manifest + ".postrm"):
>>           import subprocess
> I looked into this and as I suspected, the bug is elsewhere. I've sent
> a different patch to the staging.bbclass code which should fix this
> problem.

I tested with latest poky sources (with commit "staging: Separate out=20
different multiconfig manifests" present), but the same error is still=20
triggered on rebuild:

File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, function:=20
staging_copyfile
 =C2=A0=C2=A0=C2=A0=C2=A0 0160:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 os.symlink(linkto, dest)
 =C2=A0=C2=A0=C2=A0=C2=A0 0161:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 #bb.warn(c)
 =C2=A0=C2=A0=C2=A0=C2=A0 0162:=C2=A0=C2=A0=C2=A0 else:
 =C2=A0=C2=A0=C2=A0=C2=A0 0163:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 try:
 =C2=A0*** 0164:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 os.link(c, dest)
 =C2=A0=C2=A0=C2=A0=C2=A0 0165:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 except OSError as err:
 =C2=A0=C2=A0=C2=A0=C2=A0 0166:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if err.errno =3D=3D errno.EXDEV:
 =C2=A0=C2=A0=C2=A0=C2=A0 0167:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.copyfile(c, des=
t)
 =C2=A0=C2=A0=C2=A0=C2=A0 0168:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else:
Exception: FileExistsError: [Errno 17] File exists:=20
'poky/build/tmp/sysroots-components/armv7at2hf-neon/lib32-linux-libc-head=
ers/usr/include/asm/byteorder-32.h'=20
->=20
'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-ar=
m/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder-32.h'

The manifest files still show lib32-recipe-sysroot instead of=20
recipe-sysroot (the manifest file seems to have already been cached by=20
lib32-gcc-cross-arm):
$ head -2=20
tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm/12.2.0-r0/=
recipe-sysroot-native/installeddeps/lib32-linux-libc-headers
lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h

MLPREFIX is set to lib32- for gcc-cross-canadian-arm, so the existing=20
manifest file with lib32-recipe-sysroot paths is used:
$ bitbake -e gcc-cross-canadian-arm | grep ^MLPREFIX
MLPREFIX=3D"lib32-"

Adding an exception for cross-canadian to the the mlprefix code added=20
earlier seems to make it work:

diff --git a/meta/classes-global/staging.bbclass=20
b/meta/classes-global/staging.bbclass
index e6d0d1d55c..a9142ce780 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -276,6 +276,10 @@ python extend_recipe_sysroot() {
 =C2=A0=C2=A0=C2=A0=C2=A0 stagingdir =3D d.getVar("STAGING_DIR")
 =C2=A0=C2=A0=C2=A0=C2=A0 sharedmanifests =3D d.getVar("COMPONENTS_DIR") =
+ "/manifests"
 =C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLPREFIX")
+=C2=A0=C2=A0=C2=A0 if "-cross-canadian" in pn:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D "nativesdk-"
 =C2=A0=C2=A0=C2=A0=C2=A0 if mlprefix:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sharedmanifests =3D sha=
redmanifests + "/" + mlprefix
 =C2=A0=C2=A0=C2=A0=C2=A0 recipesysroot =3D d.getVar("RECIPE_SYSROOT")

Ovidiu

> Cheers,
>
> Richard
>
>

