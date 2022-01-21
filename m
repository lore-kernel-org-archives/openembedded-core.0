Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C466C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 03:33:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7022.1642735987104403222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 19:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=nfIWztCF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8020d4495e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20L3Mmkp025283
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=MxBcYB455ZW7gaUN7v2hDV1MDKEw8H5D0HJgx8p6w9U=;
 b=nfIWztCFeptFlksrE5LW/UIApqQHtXmtnLT4pft+ARTbruZ6yOyFMiDy4KHzqGGBCiW+
 xvr5hvK+rJBdXhjlASD6jz6RO+qdmUSoEHlSwb8zeSaCi47lG2JivNKvRakQMIANuMtT
 NYtWaaCPE02chRHConGu/cIYXMNWHzoc9OMa3nd86u/0Ki3L/74zWEjGP8dDnX56Mn8R
 FzB6xWKgZi+8pLxY1QAkMycrLbGbDDZebxZIoCdj60mpbWIJDCkn8ao67VKaz0vbLb7m
 oqvdbUDoXnGKtzrCzXxr5pkdqbaCwDsh+4jGHRG4cVUdk3eJKtMMBfxDCXv8jGTB5RNK iw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx7838r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:33:05 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20L3X5V8010467
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:33:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx7838q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jan 2022 03:33:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLUPnsEFWrC2Y989DEhkg9NbLDx4UVhPTm3j5loxNuvnjSS40wGZKO1OySDFx0A20Uc3BDgkWpgBTwxxDfgVOvN/BB72G7ZA3F2wTXU47aGvRP2sLTCKnp/k2veNnSCuXTt50JWonpzavXdCT7R1Bs008tp5tqoS56g8rmdgBaCXBgdev6kS9VgfxFNG9ongjbxBt2ah9REUZv7hWNDzv2uh8sMsVecNavUGJXQ94uNu7Jart0lK3PeUIczZepFfBlNWBzhur9jEIq9frY4DM5DS3aEqmv4zcMJ0Jh5nJkqFiW8yLoHKBJ8WuyyRmy5+ynMgxPHW+20Jfpq1VUMPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxBcYB455ZW7gaUN7v2hDV1MDKEw8H5D0HJgx8p6w9U=;
 b=BdF3/u3xYBBjcsEDA877kx2U2cfvKNUH1gETgL0M3xvvc3I4ZD9oukvje1o9h6haBnyU/UuZDzC8KWX2l93FLIQyh5AjBPHKmOJIvfGUpZZdV1zAmikzukgoS0AZ05dgj93SiNmSdaZKYZQ5RFK8gwTA+tQRV7TLZUIo2lwoBsi49dFee2hNM5FAImSoQx6nLX8jzEA2f2mIQWGwRNMVzN+tJPRBNL6MSiUoYV0fYvLDHlludrzEzMjrOTajXmeNLpRdQCb/I1TatveXJ3NSvQaQ8vmQHDItIPYxDgN6nwsAJZYukRDK81rZDWdy/aDOAvVrU0/ND9FNQrolc9ZPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH2PR11MB4373.namprd11.prod.outlook.com (2603:10b6:610:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 21 Jan
 2022 03:33:02 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 03:33:02 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable
 task network globally
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        openembedded-core@lists.openembedded.org
Cc: jupiter.hce@gmail.com
References: <cover.1642662353.git.liezhi.yang@windriver.com>
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
 <1f3094ee-e729-084d-8be3-42bbc8a48010@theobroma-systems.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <464df233-18de-8a1c-113b-071ab0581c7f@windriver.com>
Date: Fri, 21 Jan 2022 11:32:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1f3094ee-e729-084d-8be3-42bbc8a48010@theobroma-systems.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5217a199-d6a2-4fd3-3c97-08d9dc8eba66
X-MS-TrafficTypeDiagnostic: CH2PR11MB4373:EE_
X-Microsoft-Antispam-PRVS: 
	<CH2PR11MB4373406EE1EAF93DFECE008DFF5B9@CH2PR11MB4373.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nCTg4BbvZ+flZw6w6f49EgoECEqNQqZsDQnNEENGUplSk+W075JNdvZiwlYMmXb3TxsPHEAWtfslBb0Mx0rOVqEqYQRzXNZP/xAiyKG45R8BQAp5zKvUkGKoQwlqkQTNLeF5RW2ImxemG6RqvmbGmGdSpSNc2WFh3YyzTpHDpscWDvZl0qXXhfHoAbU8FCQ+dYo8J3wyEfkNJDy+riWpqaA998U5qNVGNAh4+TSQ+WVmrYYsVw7zm3sud/poLt+6xSknd5ec8fFQ9HWuFPQBZGYVWYZ18eS0wwTNHfmP+kscs1RTvAHJlAu5cABhuusMbgP08iRIbdP2Mkbfcs55ePpr7/iP6CkANyJZL4BsMQU/rdk4b480PK3/Dq6pz1cjbp2D5JwRLCZXn2P0kP50ZyvcVB88uxSpitqoiqE+a6Ys68XugwzVBxYQ1NVkvQ5VWYG3J4DlMFEcgUJR1Nad0V33X0OHnpUYPqqk2yFRHhlkRqD4HA65czcS9Oam4uNfDNGGkN0VEt/ZdMoK0aErkr+wV1fAxLiulfJZLybp7Gecz7EgpIqEqYljvF5WvG1vRra9TjsoiJNNGWemjlIYc1nQHtC+s+JDV2IXSAuHblIi4R5tU/YbRYN/SdIZk+cnNIjCjGXcZdmFuXBbzGnO/QeqjNvmg6HfHnTzAogrZeLcLN6LP9ABq1sxz1wfuaxHakf1nYTXEFZKLp2LCnfEmRYs8oC+mbyCZ+0r7OPE+cVvNXEn4c1NKy8z3buWJqls3FGlsVmC5H/iKqIRNwPMyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(316002)(66946007)(8676002)(8936002)(31686004)(6666004)(2616005)(66476007)(66556008)(5660300002)(6486002)(38350700002)(508600001)(38100700002)(26005)(52116002)(53546011)(6506007)(2906002)(6512007)(186003)(4326008)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3lvTWczSWxYTlNRc1h6QXY4TUNFUFFRWGM3N1dWVVpHcEZpTFJsUER4MUJq?=
 =?utf-8?B?aDFybEFGM2VVSTRLbTdtK08yQkZEWE5ZOEVwNkVDajlCTS80ckd3Q05wVzMx?=
 =?utf-8?B?d2F2OFRBRkdkWVh4cUtYaS9qUU9zRXNUUWRpOGw1TVpCYlV1eFkzQ0tQRWg0?=
 =?utf-8?B?OVFRVUh4UVRZM2JuMzdGb21sV0R5RlBNeXpvVWNnaFdyTWtUQVlRRjhkQmZx?=
 =?utf-8?B?eWZveTF6YWZLZmU3Zms1aVdudThLNkRpZzV3TXZDNWVybTlkL2pPZFJjMDRz?=
 =?utf-8?B?SWZKUVJ0aVFMRndzUmUycE9iYTJNeEZ0emI3ZndRaTd5Q2MrTHovRlhFS2Uy?=
 =?utf-8?B?QllVTGtvL0c3VUFiTE5nQ3MyM3ZCWitwV2hScWRyMEVUUzdWbVF6NHA3eUQ4?=
 =?utf-8?B?MnQra0x5bUdoVFlGTk1QWEVwaHVMelpVTzJndGpPcDJxdjAxUTFrSzA0SGd0?=
 =?utf-8?B?RDFsd0xMTm9Bam1nWitLTUJtWHhKbTJkckF1ekVBMjB6OERyN01YS3BISFdt?=
 =?utf-8?B?NmE3UER6OGxMV2VXNVVDblMzejJSdnBTU2pEam9IS01nWGt4elhoSm1ya1Zs?=
 =?utf-8?B?RVN2VjNDbmc3eTZyZ1NYRzkwK1A4bUJkaFp1TFJPbFNpdC9qdCtFUXM3eWc3?=
 =?utf-8?B?R3RVRlRVV1J2M1pBL01yKyttbzRoS3FKMXVJdSt5ZzJIUEwzckxjTk5ib1o1?=
 =?utf-8?B?aTltSjhQb2pXYUNRK1lkUENjRUozMzczQ3Fkd0g4WkJSR0w2WkpERm14NFhH?=
 =?utf-8?B?Uno4TzJ6b3I3NTdPRWMraEhLSGh0WXNpclZLdm5VWEZ5UDRaMG01TnZpOSs4?=
 =?utf-8?B?MFhPS0ZmNmtQREpqVnRSUm1KMWV5WWJaWjFpWmxpZGJUSDJmWTFzc01GVHZu?=
 =?utf-8?B?ZlhEcU5VSWpxY21hYjc1WnoyeGlyRElidzIwbGx2QjgwTmdjdjdHWFZhbEJT?=
 =?utf-8?B?ZTZMTllad0VVUEFIS1VuS2puMGJhTW40cFo2LzdEZTdMWnR2eEdWV0h5ZFFR?=
 =?utf-8?B?Y0p1VktGM285K09xblVrZWVXMitvVGxYYzdZUnBYaTZKM1hZNkFLYkY1VHJU?=
 =?utf-8?B?V3EwMDZ4VEc2eXViSEtOaVgwZnp6NjZMUDJFVGNSbWtER1FTZUNYc0w0c3RK?=
 =?utf-8?B?SVJocVFwNzAveUlVb0plbDRQdUdYYjZvUHU4L3pCM0ZkTFN1aC85MGhPV29q?=
 =?utf-8?B?eEF5SUxZWFZ4MVlMTnViaWpPeVhpYlBCM0pmRFp6c0VKUm8ySUZSZy9GcDQz?=
 =?utf-8?B?eHNjUFBlQ0ZnbTlkdU16YVRDQURpVkQvekhORkEydnBYSjRteC80dlpSY2oz?=
 =?utf-8?B?YjBTVW1xVFBROGRkemYvUUlQTmRoZjZNamsvMnVqQzJ4bzVDL0xZRWlBNkZa?=
 =?utf-8?B?MXpZUUpiNnR1dXVRYUQ4Nm9oZ293S295eGQvTTFEak1UYXRPQ3RMZkRqamtY?=
 =?utf-8?B?R3J2UURreTJnVFpxV01BOGFENFlETTV2cXhQcWdXL215elZqbG1wbUFsQnMx?=
 =?utf-8?B?Qjk1K1ZzemErWk04akVRTkk2N2hmRmlLcmFjbG16UjJHSjl0REZyd0txMWJC?=
 =?utf-8?B?OTJCemdYak1MMURRdWVtYUN6UVJpVnhYYVJHMnFMVW4rc0NVUm45V0diOERZ?=
 =?utf-8?B?TDY4N2JKaGdjY1dDRTNKWEdrK0ovZzBmbzR0RytXTkRxdEN3N3FseE5xZ2sz?=
 =?utf-8?B?WGh6QmsrTXFKVEhlRlozVkozQzVpbStxZUY4WVZwSjBoZDN6ZWZpb0hoV2Iy?=
 =?utf-8?B?aVJja3kyaXBKcHM4OUYvSFdOSWZENkZ5aGdFRFZjRWNseGp6M2oyN3ZncFZi?=
 =?utf-8?B?SVFSKzBsRUdMaWk5U1l0a2themwxMjJuQ0t3MmJkcHlhcUpXNjJ3cG8zZXhx?=
 =?utf-8?B?Mi9rQVg0OHFjZXA0WlpidDlaT3dleFB1L1dpUUh2cDB4RHowWHI4M2FOd3dN?=
 =?utf-8?B?WGZlQXpsMUg1V0xzd1Zmelc2UWVHTVpUbTcwdU80dnZsQ2dlbS9oTW1OYUNP?=
 =?utf-8?B?dDc4dFBKd3Bsdis1TkRROTdGejcxT053RVBLMVZSNUYvdjNrcXpHMUFTMFR4?=
 =?utf-8?B?anUzMjhSRUw4bkJkMTNWVU1pcHhqaUNsaTZ5QzNQckpqVkY1YnJxaVdIME5C?=
 =?utf-8?B?a0F5WHRhdzhTRWZ5UkI0aG9YY2I3VHU3VzZLY0ZIL0l4VTdJTFNrWUU5TzA3?=
 =?utf-8?B?QkRMVG9mSC9CZXo5UTRpL0tBTUt3eExham0zY1BodDA3dE5pc1dZWnVYOUxw?=
 =?utf-8?B?ckJQdFpnKzMyaHg5T0V2Y2htZkt3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5217a199-d6a2-4fd3-3c97-08d9dc8eba66
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 03:33:02.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dGPNMivMP1AA5egVl8cWEUu+HtExujBPDg2E4jlgaN41kVU9w7HC4eBng9gTafUDz8w6D3epx9KQX7dhlMMJ8Hhd5VUNsT4WYXlZuf06JRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4373
X-Proofpoint-ORIG-GUID: meVkkyA5gcTmXeAKfkfcfXq5dEoaZP79
X-Proofpoint-GUID: tWLo9eGFl0uVFWRgTEJC0SDWpUDUlPe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_01,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20L3Mmkp025283
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:33:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160811



On 1/20/22 9:31 PM, Quentin Schulz wrote:
> Hi Robert,
>=20
> On 1/20/22 08:09, Robert Yang wrote:
>> The NIS or icecc can't work when task network is dissable, add BB_TASK=
_NETWORK
>> to enable network globally for such exceptions.
>>
>> Note, enable nscd on the build machine might be a solution, but that i=
sn't
>> reliable since it depends on whether the network function has been cac=
hed or
>> not.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> =C2=A0 meta/classes/icecc.bbclass |=C2=A0 2 ++
>> =C2=A0 meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>> =C2=A0 meta/lib/oe/utils.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +=
++++++++++++++
>> =C2=A0 3 files changed, 20 insertions(+)
>>
>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
>> index 794e9930ad9..c39c86458a4 100644
>> --- a/meta/classes/icecc.bbclass
>> +++ b/meta/classes/icecc.bbclass
>> @@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?=3D "${STAGING_BINDIR_NATIVE}/icecc-=
create-env"
>> =C2=A0 HOSTTOOLS_NONFATAL +=3D "icecc patchelf"
>> +BB_TASK_NETWORK ? =3D "1"
>> +
>> =C2=A0 # This version can be incremented when changes are made to the =
environment that
>> =C2=A0 # invalidate the version on the compile nodes. Changing it will=
 cause a new
>> =C2=A0 # environment to be created.
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index fba99e8f0cd..bf5bcd55519 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??=3D ""
>> =C2=A0 # what it would be anyway if the signature generator (e.g. OEEq=
uivHash) doesn't
>> =C2=A0 # support unihashes.
>> =C2=A0 BB_UNIHASH ?=3D "${BB_TASKHASH}"
>> +
>> +# Enable task network for remote user such as NIS.
>> +BB_TASK_NETWORK ??=3D "${@['1', '0'][oe.utils.is_local_uid()]}"
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index 136650e6f74..c21f034aafc 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -595,3 +595,18 @@ def directory_size(root, blocksize=3D4096):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 total +=3D sum(=
roundup(getsize(os.path.join(root, name))) for name in=20
>> files)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 total +=3D roun=
dup(getsize(root))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return total
>> +
>> +def is_local_uid(uid=3D''):
>> +=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0 Check whether uid is a local one or not.
>> +=C2=A0=C2=A0=C2=A0 Can't use pwd module since it gets all UIDs, not l=
ocal ones only.
>> +=C2=A0=C2=A0=C2=A0 """
>> +=C2=A0=C2=A0=C2=A0 if not uid:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uid =3D os.getuid()
>> +=C2=A0=C2=A0=C2=A0 local_uids =3D set()
>> +=C2=A0=C2=A0=C2=A0 with open('/etc/passwd', 'r') as f:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for line in f.readlines():
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 not ':' in line:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lo=
cal_uids.add(line.split(':')[2])
>> +=C2=A0=C2=A0=C2=A0 return uid in local_uids
>>
>=20
> You can return ASAP instead of iterating over all users:
>=20
> with open('/etc/passwd', 'r') as f:
>  =C2=A0=C2=A0=C2=A0 for line in f.readlines():
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not ':' in line:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if line.split(':')[2] =3D=3D=
 uid:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn True
> return False

Yes, you're right, I renamed the func from get_all_local_uids to is_local=
_uid(),=20
and forgot to change the logical.

>=20
> Otherwise, since we explicitly add icecc functions to existing tasks, c=
an't you=20
> just add [network] =3D "1" to all=C2=A0 those tasks in icecc.bbclass? e=
.g.=20
> do_configure[network] =3D "1" ?

The icecc issue is reported by Jose, I'm not sure whether that works for =
him or not.

>=20
> Also, even if icecc is globally inherited and enabled, recipes can stil=
l disable=20
> its use on a per-recipe basis in which case I don't think we should hav=
e the=20
> network enabled?

The network is disabled by default unless set task[network] =3D "1", and
BB_TASK_NETWORK is for preventing the disable, so you can't disable netwo=
rk
per-recipe basis, otherwise, it won't work for the case like NIS.

Maybe a better name should be FORBIDDEN_DISABLE_TASK_NETWORK.

// Robert

>=20
> I can't comment on NIS support. >
> Cheers,
> Quentin

