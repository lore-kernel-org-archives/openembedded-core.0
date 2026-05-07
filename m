Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37E8CD37AC
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 20:29:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5411.1778185777073052743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 13:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=NhLo7Z42;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9587ce8c1c=quan.sun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475vgFr3332388
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 13:29:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QxPnnpDUNlcTYJLNoU+q+ermP29RL3iVOaW9sTgE8vw=; b=
	NhLo7Z42DvV7FI3EM9Npae1FZHSMSRu/d8I6yMqjpEBaqZ8GuR4Me5JAB8K344VN
	DXbBIZqhjVq5w0nD4kdyhnNHMUs/E752FrWMa3JjKLvyHQPqV9tpwrYJfVTYOp7Z
	ah9wUWIJogudJK+ptmMH7zPW9OEahCcnyYYJjABCadbc0dm39adO6eLlRb0L4EwJ
	rn6K0ashMIqCQSNN1bIocDgpsqBM4C4IvK3gPnh+j8s2DTIurt13lC3W6U22EmdT
	JI41gdPQK4RdPATYiAANjp5ApcZ50rEUHx+25xd4LQFQZTyneiLqpHJRmSchasnF
	CJ7gcREp1SlUXUyr6vCIKg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyy1b6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 13:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imR8FvjSijjZw8iVQufHTp9lLfwuVOt8YBroTuhnoe49t07JCTpJGhW009JUv0yWsCx7ioPJzOH8ywo0JjH0BuSjzBWDaCZ/++B81QF64IeAWpgUqU0V3RSGNJHNkuSZs/gd2xXINJqET1aOEY+YLIZMgr6wGZe+ZP4S1L1aOXI7qjcaQgxB8zB+0erQgZW9/xzFG8HvcHVIlJC2OIN1l97QkuaWi3VZ4mra0bWYKYDTCoFO4ThATdwBUYlnW0gSq4FRZUSWMdhmBhTPUPm6IaxE1Y4wKD4stJ1A3Tz5qBCUhEy3mEX/o7PmCdCR7I1W7mvBF02LkQZdP73aBOXLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxPnnpDUNlcTYJLNoU+q+ermP29RL3iVOaW9sTgE8vw=;
 b=ifcC8DIy86Y/KMceVqdWee3L8X3fKbg+32nWZRCxbtA/C6/K4AvY3XlNyYi3iy2rA9CZY7Da9OUhxFIgqSfUgU6f7BIO4o39UUHLdpCsyvcC07KRjtlo6HRMipt+x7xTnmXByrfXDKkgDjrtF2r93eS9FhHRvZsR2f6XHoWKQzR8b+5APd537b7ZcOEdBuegT+xriVlSRb5pBLDuzew/UGvb0OTixH1FUVLJlcsmaa253khugqFapVWjENG7cCpGwvUPMUxKjNl49FvajmGmjTPMZP0U+MR3CyLdw3az+EZR6BQKeZa/F+iilWb+EgG+h6i+crWughRyMGwQVYW+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:29:33 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 20:29:32 +0000
Message-ID: <2705098e-1dfe-4d9e-af37-aedf6771c392@windriver.com>
Date: Thu, 7 May 2026 16:29:29 -0400
User-Agent: Mozilla Thunderbird
From: Quan Sun <Quan.Sun@windriver.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
 <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANNYZj_++oDps3s2uq51a7j3CQgK1MSuuSgY9Cz0-wFtE2gnSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQ1P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::24) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff51d48-96c1-4008-b097-08deac7758ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	MSMVG3NVkogOPfuo49Zk9rNwtsg3OTEb7l0xqgTft3XYd6Ci7sDQMshHWZRlpoDd5QYGd4FfQZXIGgPkdK0nbb2qyxXlOHApc2ILci4ZSIzP3AlwPQDitSzFzT7ect8vq4hgZNJGB5O7bhFXyVAikbv0H/B96ySYbH6k6ah9e+hulLNrLsAKOASIHGZxHTCUU+Hq03xrBPlqJb0P3PtP2/BqkbeT4aeJfEsDt40z3AJdRmQTM1eEL0xwNhP+VQOps+JwSut6poPnlgtnN40CSbh1unySlPBKzv/x0RxnaHyA/thY0C9MScVznaJfzMKSQ7oAuf5bmiRdjh+nYg/7T0j4QDjeJVmc+c6Ecl4UzjVHecfXwk9Q8A5VMgbdBvsz0J0Q6ryzAkz8QEyvyNefNfk+QYQPlj1KX4nm7QTkbHzSjpfzi6HyPX3w3cUxMK12FqS+8/oD09ywsw4eAWmgoZajjgNTrspCuJ7ZnMD549Klb4xJjUbtg+XL4Bc886Dz3kNfNUk8n5OEVsjhxwoDFwb4omV0gQeT8bQyeNXN/7L5hqs88Evgpi/G3JLHlcUXHbmmWjM/uKfPS892Ayu0TU+KmtsRxHQDqUGH3Lt9aXxTq6I2KQ4jyZFPpspMRgTfi4pPj+z/3nRCB8fFXMuN2PimiRMSRm0kAkWS1d+qYE5bB4jJmqKiu0kwPho7Be1p
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M0VmTzYvdVZyRWQ5bHp2dTNob3FOOEZoRit6bUpUdmRsZnl4NXVVbGRTRFJQ?=
 =?utf-8?B?SXhlN3EwTEhJa3J1OXJwMzVZVVhYVVdXVVhJcnJFSkpaMkxtaUxCNW50NlBn?=
 =?utf-8?B?aDdvbk43R2NVVzR5QkNsNE12Q1hTYUVEcnY4aEZtYlBORURxY3lQSkFkSDlz?=
 =?utf-8?B?ZDYvRWwxQVo1cXVjQmtJS3QxOTg4N1paOHNRR3B5c0JPcEcxNnUxNkdPWk1k?=
 =?utf-8?B?L0w3REhpT0JHVExQclpUeVhZU081cW0yYkZrQytMaDg3QmVyUFIxRTkwb0Jr?=
 =?utf-8?B?M2N6aURPVlFTWmtYTTN1VVorM0RuY0tMRElTamVheW5tRFlTZDRFUW1KTnBP?=
 =?utf-8?B?eFQwbjFmS0I0ZlhqeHBJaUttMnpybEhWbGpqb0FMZGdLN3piemFiY1VENVVM?=
 =?utf-8?B?aE0wSU1LK0VyWUJtdWQzTmJnMm45ZHFuS0tjQW5FYjh4OHJvZEVzeGVIMlFY?=
 =?utf-8?B?bUwvVU12RWV4WGFlZDlKR3pBMHN4QzZYUkhxb0xDZlAraTVkQ3hjSFpxaHVM?=
 =?utf-8?B?ZHlxY3ZlV3VZVWw2NlNIMjVFOERnRzd1N0tyRlU0N1lzUWwyWjJadnJmUVpG?=
 =?utf-8?B?VUVYQUtrK0c0eHdMN0NkampodDhjWHhEVHlDemVYWW1hV1p4dTZQNVFNck12?=
 =?utf-8?B?NFpvYXVyZW5WSlRaeExqU01BR1NRaVBVQ29CMDd4eERpc05aemRtbjRNbnZE?=
 =?utf-8?B?WkpNL0RtNHEvSUlnYVRsRWtVaVI2VWEyakdZK0VsUERkTUhaemtka0kyWWVl?=
 =?utf-8?B?Q01IWjUzUXNFNXBxdFVGdTdsSnkxbjZWaG1HYjR5ZEI3bU5LNHBXTWxxYlly?=
 =?utf-8?B?cXFLdTkrNHdSS3pMRHQyNGFRalROd2l2OVUrUzdDUzZWTmN1dldlSk0xdCtZ?=
 =?utf-8?B?RVVXZWJpWE9yV3d1emU5Yk9pMVArNThaWlZHSnhrZ0xNajVzcGdBdmw0bG5p?=
 =?utf-8?B?S2RpdTA3eFd5Nm4zRk0yWUhBMDJKc0UyRnpFSUlTVUlzbHZuMkdCWStMdFQz?=
 =?utf-8?B?OWdWRDVXenpSazJ6ZkZkeU9iNHRndHBXOXNtenRIQTdmdCtNSkt4eVNnZkxh?=
 =?utf-8?B?Vi9nOEZrb1ZxUjV1MllWZHNEMzBzWWRNd2VzV3IyRDg0ZmNxRnNGSUlLdDBW?=
 =?utf-8?B?TTkrSXFoTmJzL3BIaHVLSTNQcE5oQkYvUVprdnN2SXVHR0tWQnRrS0t6WEgv?=
 =?utf-8?B?UVljeENJUHlxejJzZHduUUxOZmNWNzdWODNwdUg4UER6eDR3dUF4MFIxZ2FF?=
 =?utf-8?B?MnNqSnFyS1NuL0U0UGN6NCtkQnJZVldEekQwRmI3SEhyMWx5S2ZXdzNyYXRj?=
 =?utf-8?B?UVFXS1pTZ0dOZG5wTEs4cVh1TjBBOSs5WTdZS3VwWThvbTF5VTdBUSs3V2JY?=
 =?utf-8?B?Q3lNYzNSVkx0UzRjNFBtTmZMNm9LUk9IdW14Mm1jRXF4a3hiOW1vckpURXRG?=
 =?utf-8?B?ZWV5azlMcFdFZU1PMkJwZlRSak4yZG1PWmIwejVVYVVuS3NUQ0Z1bzdiVGp6?=
 =?utf-8?B?ck5LTHpwOHFCa3k0WVdZWlZBdVBCZmVXckVieCtaTHczaXpXaWNhYUN1eGRV?=
 =?utf-8?B?aVlCZ2dQK05KVjNyRmhKZ25EMk1SR21kSkxRMjIxS05MWngwUkg5Nm55SFVv?=
 =?utf-8?B?Rm1XbWVSWThuNGNWTDNqSGl3WnNaQVZ6ZCtnUUxua1AwdzVIWExnWkNQTU1l?=
 =?utf-8?B?bW04eHByMzdVeHNqTVR1MVZYb2RlRkYxQTcyTCtqNnlaZFFNelVOSzI2SWp0?=
 =?utf-8?B?NVJMSzRPeE5HdFVOZlVUT3hWbG5vcWpVOXNjSThwWWNJOGZNVnc5M0JRalNK?=
 =?utf-8?B?SXVJYjlnMDFNeXI4QjBPZW5abWFPSUEwd1ZjZWQzaGN4YWJnVWszYVd5Vloz?=
 =?utf-8?B?ZjV5NzNUUDFXa3lZQUUrL00wS3NWOWhJZ1J0aUZJZ3daQkE1TGRKWTVpTUZi?=
 =?utf-8?B?cTJ6SUp2bGRkdERLL3pNK0tsVCszZkd4WG1uRWJpeVc4c0NybVp5WHhvUkZp?=
 =?utf-8?B?U3YrMVpQZWJYY3dmTytpUW5zaGs5U3BBL0ozcWtvc2c3OEZKVTBlSERaUTZu?=
 =?utf-8?B?Y2VrbGFXSnJRc2t1azBKWjF5LzZvZ1Q4SFNZR3haWVRxblk2YnFNUXNXckJ2?=
 =?utf-8?B?QTRwUTdWT1JEWEdHdGhha2RVQ2E2cDV3a2t3WUlYK2JBTitnQ215Z095Z0dI?=
 =?utf-8?B?c1B2QjZsUm9ETEpQRmFyeHBZMVJNcXZXOFpSekl5eHZOVDF3Q0ZPTG5EY1Bk?=
 =?utf-8?B?d1NzaDhnblU0L1BPNlI2NnNPWkFrZzJpUkxGa3k0aWRubGx0M1owbldPWEZI?=
 =?utf-8?B?Rk1VT2plRnJDbDhyRG5Ca3ZXZkhxVVVqdGFvdkhnMi9OQ1k1cGg3czVBUU1a?=
 =?utf-8?Q?KNK3w4+qljTBkma9DwqenZXR+eUBdr9F4cC7gqKh6OSmF?=
X-MS-Exchange-AntiSpam-MessageData-1: mLMIIy4fl5WSBg==
X-Exchange-RoutingPolicyChecked: 
	DhOn6Mvm8y6ZnxsNSE+yy0gCUKmns3p2Fv4E064U6yCFuwHwOpkRrKk9uXgbx/NeeOLjbMKGli95sWH8GrnM9eCG62hLcL0ydwktFQgqohTDzs4HMS9cE+u8L30GhY/y/4gjbBtYjKssNCF4GBiYX3kqNkrQ+OwHF8sjcNvkUxyqCPdzDvhD5J0FIASR4TqGBGiJ7+ji4AA9LiubW6D+WGN/PbAkjfv08Z+U9iGsmCmkNaX67q15l2Hhbl6D9AOtcPYYC6DJhtZyODDtMtU758YzPjwQeQMqI0KSoRWny7mf/P/jP1nbp+/IphI+cfryDFpzomJokUMXT//pXPm11w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff51d48-96c1-4008-b097-08deac7758ff
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:29:32.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvaUqq5ehEsTyCqqD7gGoGLlF4ncCFDKCnTk1tJhqhQ0HufC9cGbnFSakorET+nOJ8NqlpdSHE5zo2duQkQf+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIwNSBTYWx0ZWRfXwoijOy8g/FK9
 nLQDOhDbrTKH7eMWsAySkjtPzLqFnwQ9P3HQaToGNXCOMogm8H1KgpUrBV8OQV66tWwjt8P5S3+
 z1ldPJcyX85t/ZfBs6Pl98kB3yS90pGQcnaysy9WAJO5W6ZodzCuqSOXw3ioaZIGqIqmP+lOKNX
 qZKE8yZ+IAT5KwgNgJtLWL/VewaGkyDCr9krcZNrUoC3YLCN+04ns4pNEHIni6edHAoONe0yrcF
 Iuwj0QdZO2awiYBYjzOVNxm7i2HoNUyylrjIGSfwxr9TUoyM8e0knJPTo+QE07je2vq7cACCx6E
 XiX7pqJXmGpqrFjaFcTLpZpcWpRpwYdCxubWfm3OkS30RXhYjh62MOcMcl3VNAROWDK5vZZMHSH
 QDnRCZL6IWMihLK5uMnebnkaBBbqQXh4dJc9oEishLix8wjWuOdYJvAOwY/VINDskYf2avUGTSE
 0FiNbLwIMMAXRvlRfRw==
X-Proofpoint-ORIG-GUID: d7mbaQ3QIFUZ7vZP-hd3o5KcXhyUdNDt
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fcf630 cx=c_pps
 a=THEAVZb93WkyejmpPpFvRg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=1jh1aNqkJ5gnC7cqZ9sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0J5SXPJpRzS-0klizSSwL9JaIP5itQYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070205
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6475vgFr3332388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236618


On 5/7/26 07:23, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 6 May 2026 at 23:49, Quan.Sun via lists.openembedded.org
> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
>> +SRC_URI +=3D "git://gitlab.com/qemu-project/python-qemu-qmp.git;proto=
col=3Dhttps;branch=3Dmain;destsuffix=3Dpython-qemu-qmp;name=3Dqemu-qmp"
>> +SRCREV_qemu-qmp =3D "82006cb788d27b090a8b84fc7831feb9c528bcdc"
> This component should be provided with a separate recipe.


Yes, will do.


>> +From f013e84d382bc1bd7d49206bdf47c689b0c6fbb5 Mon Sep 17 00:00:00 200=
1
>> +From: Quan Sun <Quan.Sun@windriver.com>
>> +Date: Fri, 1 May 2026 13:53:24 -0700
>> +Subject: [PATCH] meson: fix subproject include paths for standalone b=
uilds
>> +
>> +Upstream-Status: Inappropriate [OE-specific]
> This should include an explanation of what makes it inappropriate.
> Don't just say 'oe specific', a lot of other patches do it, but it
> doesn't actually expain anything. What happens without the patch? Can
> we find a solution that would be acceptable upstream? Adding
> Inappropriate patches should be avoided if possible.


When these subprojects are built standalone (outside the main QEMU meson
project), they fail to compile because they cannot find headers from the
top-level QEMU source tree (e.g. include/standard-headers/ or root-level
headers). In a normal upstream build, the parent project provides these
paths implicitly. OE's build environment triggers standalone subproject
builds, requiring explicit include paths.


This is unlikely to be accepted upstream because QEMU does not support
building these subprojects standalone =E2=80=94 they are intended to be b=
uilt=20
only as part of the full QEMU tree. The standalone meson.build files=20
exist for use as subprojects in *other* projects (like DPDK), where=20
those projects provide their own compatible headers.

Thanks,

Quan




