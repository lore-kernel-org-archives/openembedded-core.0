Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46040CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 02:19:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12883.1779157142992906792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 19:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OCgG0LWi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599546fe8=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1PFTY2681104
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 19:19:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=C0lWpyK4yEnR114csK2IEz92NeRoC237gvwPxsOOGXk=; b=
	OCgG0LWiUVZoz2Wa7erOwLdCgHjzSjGDY7bW25wcOWJpd1kkiGkEBYgIJ9iayNOy
	WEw5j3zaj4fHbUVmBJkGWGkpu3r+T+s6OaTiRo3k6CHdZXYAbtA5HV1RHf04n9AI
	MpFlBn3uMhPIPSNj+y7LYaoT1+53S2EqLhUB6QGtoOWo5t20n9nN8sMNelniAdbJ
	/WvFGa6tcGsKOC4m7OIi+B4g7pEQ6Dm5YxYttCc2ptA08FFDBI6rmP7ntvADK09f
	6m6jcHdeWcZWrRpwtVKoWoY59ZJVXdxAMafwtuUmI6BrlEIvlNTo6FDb6lWJcfMP
	lYaWZaBgyHPVKP8pcBomDw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010030.outbound.protection.outlook.com [52.101.61.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3ganc5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 19:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJN2TBfANHlHyc0CTbdlJ8tKYc7omz3msF4bYEpEoSYn+up853IzHxKH1Yd/aTt9UFIw1+DYfNPcOLXuJsSW/zxMMtz9ZWjWfyzXfXS4bd+segdHQJfr1EWItyx7ARZRZPdI73K588fiIr/j62JqErrxviuzFIaOo1zEXGgpXy0zRZ1aweixSxSw8ycxBYxa2MTxtjX4b1w7siRYoh9qL7cuL3njY3ALuGW1agUvF5jhkSpKCnuKVuk3dvKNcu2VK10PjnhFNE8+ifVnnSEKyOJoGZk8gL7d/QiyYQxIDiNRqaFG8sRg3QyTPHILykIISPROj+wAMAhCi6axDLPang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0lWpyK4yEnR114csK2IEz92NeRoC237gvwPxsOOGXk=;
 b=fDQCpDdyK1HCM07ry2ei0q2WyPN8sF2WHxbxgQDErKBQps1tlCe7vCCon9M1oVlYWPaeW4+LaAIr2QXuP0sdJhA/bJvJXsfB/5vTCqetDcR1oponWACKMQH9Gb7PAYGX2cMwzWJJuAyzOT4BkuEI/bTHIOn4nFJQotKkdhJtAkZ0Ul0XOZm4I6WcWIuII7/hIyX1SOmn3cDhU9fA0nUiP1ahbhzwi1tXQlydOfkVwXbQWjtko1KzmZwJI7+3E5hNu6zFWp/RAg8+en3AEelRSePUWB34W84jfTJ02H/zOte+aElTBY3kSSnIiyTSRb5WRciGk74SAFiPJmxeRCkwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA7PR11MB9595.namprd11.prod.outlook.com (2603:10b6:806:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 02:19:00 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:18:59 +0000
Message-ID: <3d2aad6d-bacf-4885-999e-26555cc30f1e@windriver.com>
Date: Tue, 19 May 2026 10:18:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cgo-helloworld: init add
To: Paul Barker <paul@pbarker.dev>, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20260515024119.4192524-1-changqing.li@windriver.com>
 <1b05833208339033ec4ae244d71d1391b4fe42cd.camel@pbarker.dev>
 <CANNYZj-pCF3r5PMPO+f-O2KNc=iwc74Nxg3jHmNY5L1RLOEkPw@mail.gmail.com>
 <3e3c326a5b907cc8c10521bb7590c8738bdaaad6.camel@pbarker.dev>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <3e3c326a5b907cc8c10521bb7590c8738bdaaad6.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA7PR11MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a1c348-f372-43c8-8431-08deb54cfcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bO0Zn9g11Td5lSrwyk3JLkB4f7qPBo0AY4A3XWjeJTWkSGzrKLG1mo+tLWCo4SfUtxX/kVxf4uRq9QbwgsizMW/kPQX8wNPk/tUzrMP0vke0XJUF2kFRSiAMvABoM3xowtzL0NHCjsck6EtiC9KVoLFrSEsJD6Zk3DvPrwG2FtcGC6/cn7PLnFAEQpwyqFjwX1yoJar4KL0wbgrOm3i5FrKQe4OElSRM6BUSIobYnYNCvH3WLI1lMl5nnTP7GwPNHPJ5u8GFzGvs6s2g0veQJqhDWM1ee2YhMQ21u5m16J8jMSkHtkwkoG9by5yHEghYbAuoDH/SpssqtrL8UUHTiK+zblnBHvWlyRr9G9s0lRRGQZAnkEpK1UysUoNauhDB26EKscNJNp5/YKYDRqrUeKeSCggmmYCTpRJ5ofjmxO+hPhMnqn6ZmCKYceKCNVpwVrw+W1JiNMMkay0Ix825KklDbg5/fSDI0xwKTV4rDrlVHGhCAdOWgoX/Cn1QuABf11Xfo0DVKimOBqB62RYGh/Dm5rpNFtA15yCLJsjUx5CeoEPaQ3DJXy8fnc3DpT4Cj6056DqyJe6Knrk5cpI61eBpMaAkqqpb1ynFLQfxpAH/TZKrHq8FipH68jhLgLjAdP9MSug3XttBXzRJIyfxvPBqn9c3QiZwirvWe/XxfmyhVn/TYLStDvzbn5SGJ44Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDVXdXpIcGxVVGZOYnhWM3ZnbGRydTZuNGFOVzN3d3RwQnhhWFBtUG93b01B?=
 =?utf-8?B?ZjhmUWM5MXQ4MXlia0VGK1NWSzZDWXlTbnJYbUtoVVJxbmZIR0FCS3FMMFFM?=
 =?utf-8?B?QkFxWWQvWVIyREJ1VHRWd2hJbzl2N3MrMzlxYTBqNjdiSEUvV2NnOEozNjQ3?=
 =?utf-8?B?NkNqVUI2Uy9rVDljTml6ZW5ZT1ZEQkNyb3NZZU5NOCtMakdvWDB6V0pIaGY1?=
 =?utf-8?B?KzR5Qi9mUUkvVEVWSzBBSFRLLzY0V1VpaTdFYll6bGxwNDNnUnNmeG9RM2pn?=
 =?utf-8?B?UENHR1BTTTlKY1huME4vVlFLR1ZQZTRBN3NyRkZINDI5RElicUNycGVPVU1S?=
 =?utf-8?B?R3UxbnRuZE1ERHJoQUpockEzQlVITHFNZWd5Y2R0MFBiRDlOait2SEVDZ1VF?=
 =?utf-8?B?eVhJTGlTWURXbXRmc0RRZXFaNURsZ0lEVExydHBHbUpRVG5mK2NZckdwSEpq?=
 =?utf-8?B?S1EyZGw5azNXc09sUFpKU09HQUJoWm91VTFVd2ZkY2lNK0RMaTNPU2sxTzZO?=
 =?utf-8?B?cWtCamY0OWNyTHFRRjRkVGxSbzA0QjN3aENFNTJreGw3QXpSRFc0Zk8zSnIx?=
 =?utf-8?B?Ulg4Zy85WDdGeEVaNi9uVzdLM0hid0xaM3BIcVFWRU5NTTRBemliTFlNSW1R?=
 =?utf-8?B?R1JoYThYeGR4UjF1TE0yVjEraWZ4ei9CR2ZFUk1rVDJ1RVVGN1B6ckpzS0xX?=
 =?utf-8?B?TzNYMitMcG1UVmhaMUN0WTdEajcxMmswTE1xVFhDZFhWWkVrZGE3clV6MFRC?=
 =?utf-8?B?VElwa1NnWjlCNTFIbGxWYXV0ZExGVmlUK2tUMVRMYWhNVjVWMy9KMFlEeU80?=
 =?utf-8?B?NDl2bytYam5Bd0VkWS8xZXRwUnpCeWVhc0hhZGRPM3BtU3pzNGc3K3Z2MXFM?=
 =?utf-8?B?WkVGTTdRY1FxMnBJekl1QTdmUjJJbU1zVXp2c3BKbENNaDZVTDlLNkdCWVRz?=
 =?utf-8?B?a1ArbElRR2NDM2VLWVRJaUpGcnkwZldGQTRRRCtwQ29jSldNVGtwRUFXQ0Rk?=
 =?utf-8?B?QjczaTRMdmZTM3BwZnB2UncwN3hid29oRjFPT1E3bWhkRGk4US96ZXJncmtQ?=
 =?utf-8?B?YTBGeHRFSVhLQWt2L3dlWmJBaWNqS0xoamE4NW5XRU1KVXdXK0JUSnBVVEtw?=
 =?utf-8?B?OWMyYWtKVzZ1cFdGQjhpemxaMjRCTnlpRFl6bGdILy8rS0xxWGJlNDFDSlZT?=
 =?utf-8?B?dVVSOVBIMWhFU3Y1WTkwTzQ2RWVEL0lsbGhocHpqSWdtcVpqbzFGenBFcmtE?=
 =?utf-8?B?bW43SXVmUFh6UWZLd2p1bXEzRWxKdEQ4bGRJT0xGT0UzWDZOVDcxVWdKVkhM?=
 =?utf-8?B?L3hYbGZjLyttZ003WHFKdkNhMXZsSEt1cVBSVE9ZYm51YjEvY3gwcE9LeWk3?=
 =?utf-8?B?WS9KY3dFN1Mwam01VWh1WkdaVjVJWVJvUmloRnhRT3UvRk5DazFjaWpKTXY5?=
 =?utf-8?B?Y0NtOS9EMnRENEc1K3J4VWFXREJiQ0d2aUtvZlkyak8ra0Z2dGZlQ3dzS3E0?=
 =?utf-8?B?ZWt6MTB2UzlxQjNVajVoTzJnODZZa3FLcnJBTXRQRmExY2dualQzdlF2TE9Y?=
 =?utf-8?B?d0VFV2lhTVpNVUZSR0lTM29FTXFTcktuSTg0eVVubEQwdEMzdG9UbDNiVDgw?=
 =?utf-8?B?TStzUll2V2RIU0tYTExsWXBkQXhqdnRUeEI4a0wvVnlmOTFrZnRybWx0Zitm?=
 =?utf-8?B?QlcvWTNOWWFWdFRPRGdNWlpKb3k4Mit5K0ZBTEJ2RTBWVFFoREpZOWtpUXJm?=
 =?utf-8?B?MG55TVZNckhiVXpDaytxVXE1TUxtVzFPTnF5UGliTHRTb0E0ZktrUlkySUNk?=
 =?utf-8?B?NUxUNDM0aUY0aEFlTkROK0lFVFVaWHJWakUxeWw1VEU2RmY3ZVZ6K1p5WnFS?=
 =?utf-8?B?MzhKMzkwN2diN3B2cEN1ZWg4elVQZXB4dERlRlRQRm16aDZVY3JWVUdqUHQv?=
 =?utf-8?B?RlBLTzU1dXNTK1NVVGJycXQxTWJCT0xGck1wOVVHNDM5ZTZEem5PZnp3cyty?=
 =?utf-8?B?UGhzZFhyTk5PbVdmajhFQWFHU1d3azRiVk8veDk0NHZmWGhvSERpNzRiejdx?=
 =?utf-8?B?em1DaTcvWC8wV2kvQzBGZHpiNXAwdHRmMnhVVjlOUkJ0bnpoMlFUeCtCNmlL?=
 =?utf-8?B?aUczL1JIL1JrTmJkVDdLWU91MHpzemZMTUk5QWlhaS8xYmMyRks3UXJ2bkJk?=
 =?utf-8?B?RVVlZG9VcWM0bDBKNzh2UUJQNjJxUVBzL1pyMllic2ZCOExDcHZuZ0lhSjFw?=
 =?utf-8?B?eUdRNVRrYUZybGV1SmU5TVRCWmlBVVJnNkp5QUkxbDVrVzVxUzZ6eEVGc2h0?=
 =?utf-8?B?bW9QZ2hlNnI2enRMTjVLZ0s4MDVEbTBWemllcEJTYzB4VkpvVmxnZTBoN2Yv?=
 =?utf-8?Q?b4jB2lh+/Pbp1s1w=3D?=
X-Exchange-RoutingPolicyChecked: 
	F4CxCFwMfa/NDU/Yqtk77+ZCsV5yQsNGj0pFcCl53FFDVl75AJ8cM6ZkeOh7SscS2tWvalFjfWHm0OaTJRi7w7Lz22kWZuFS5ky37YsiHHSmbaoj0wACHaAXJeSir957+lDvLXBwMCQsaCAaSkgP0LCoa1ehfMfxtq4O/Xfy97knBaaD0cLSCmSjsAoxKRsx0ZE45TLbB4sU8v06fECJ3sHmIT5kYqlfjI4cjcj5yVbSmAZJ3M9GP+VS2vfP7q0D49GPmKn0otUwGfSqkzXmCZWIJnu8KrlcsMdRbGnpVn+OYyJ6HNDEKTVawZWTClH8TZJ/7q4kuEndLRvVuH3QLA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a1c348-f372-43c8-8431-08deb54cfcbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:18:59.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB79ATool6CbLCp8cxEH5VB4/ZZGSpAXTBA5i90gLHqdlN02MYOLCWWdfoZqYxq+jpi7kbWHM5hTy8L9YFaq/nld8PAbK4dzFTJeZnusD1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 3FAW6WTdXaRFmpo7RgoIFd5XGuTCbWfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAxOSBTYWx0ZWRfXwO0VRIO5JkYN
 lZMTwbzLx9obBHSOVacHvOk763NFEVZ5apYHgs1np3jpj7qJggTOBUr9tctyOPzRE6SA+EXw7Nb
 lIw4uN7wjk/QiipjEsqa0u8+/yNC+uOx2SzNnRucqcoz/3dTiX3HGZUhqU9cRLB0UOwd8sI6z8r
 ELDs25+OST4KnasBVlvhcBtXfv37i66LkEaYR0VsfRervr36AUCTBPNY2VHLjwHqMzSu3gPC0o3
 Higr22Uy/M7eVV6ZpZNcvkPu/4hJwQDeTUFc1vmCCsjCs15vG661Vf9RT6BZK3Pu/ashRWISW3Y
 wRTdAe5ehMr+HDACvakMjcM7TQf9dghPu+f7wkynaI0KcoaiQokehDMJkYrooOlAmlWm8APUXvy
 571aklD/31xsKobFPaaLoTJ0ydxBRldJU68Gqmq4LAwdEEsjMTvXDTeZMhM3yzFHPewjm1EHSPR
 92+ILXTr0JRg5ep+hYg==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0bc896 cx=c_pps
 a=eGdyP8VkvOZnUY1FLHxo4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=c-7dQ29WtKq9CpPehUEA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: oEFBxPKKjREeoyLyO6bTHtQKJg-P0zOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 02:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237266


On 5/18/26 18:40, Paul Barker wrote:
> On Mon, 2026-05-18 at 12:22 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
>> On Mon, 18 May 2026 at 09:18, Paul Barker via lists.openembedded.org
>> <paul=pbarker.dev@lists.openembedded.org> wrote:
>>
>>> Please could you add a selftest case which checks that this recipe can
>>> be built? I think this should be added in the existing file
>>> meta/lib/oeqa/selftest/cases/gotoolchain.py.
>> I don't think this is necessary. The recipe is for the purpose of
>> testing cgo reproducibility, and this is covered by the world build in
>> the reproducible selftest.
> Ah, I understand now!
>
>> It does however complement go-helloworld, and so places which use that
>> should be amended to include cgo-helloworld:
>> meta/lib/oeqa/runtime/cases/go.py
>> meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> Changqing, please could you send a v2 with this update, and add a
> sentence to the commit message saying that test coverage is provided by
> the reproducibility world build.

Hi, Alex, Paul

Thanks. I will send update in V2.

Regards

Changqing

> Best regards,
>

