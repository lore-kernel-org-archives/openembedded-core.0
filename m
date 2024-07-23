Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB35C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 18:42:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2883.1721760117854329058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 11:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7934cb5edd=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NBmtKY022025
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:41:57 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40g8h02qfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:41:57 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46NIe7n8019672
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:41:56 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40g8h02qf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 11:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7bl8dw/X7+eB7hZTdAHXAqvwztEfYcYGYogXfnWoGjGAV4HdUDfnTgv+YGDaUkq+RCiKh8lBXzewgKGrN+1R/QdbRmfKdN1iHF9kOjorJztjri4ECDEdWzfA1mt5OfiWKkTLEMKGAf1EaWAA3P5lGpYyzRaQnQa6rV7PpC63/7VkMBoptnhQMHzULoq8Vo3OwUHF4LH3ulH6089S3U0zUmGvz324WLqDL5AhaygzoLbPQJcrM+7yLmfIpCfTXfb8qapskBcL6bTCVUGyq7H+arYwrvrqBsezoGXvBe8UPGKdM6Bew1qjPXF9gj8ePf+ZJTZLPmmLeDiokAIhNB26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJHkGAKvLPdf+kYqinjY1KqXF+Nab7KOJ3spBnSBxVk=;
 b=u3sqMHFnXzC5LS/5V1mI4PDTozZqYT0yep4x0JmBqcXE4S6+rC5rGEfAZlOsJwCuU1qz01r1O9G8Efpj77uwgLbAlnLQ/wKLKfP4c8gI0tmxIFjMIcOBiN1p+B1ERvbYEWVOdx3d5whVekRyOG2P3YKzDviZg/8b6Dxy0OkPCiNayWhDa9nXHeF/nqRYd7EDp5T0GQ7pwYglA+m5ABf8z+9hLe6d3FRwGM5GxbDFOaANXG8ApkU6bAcPAHMCZG6Wl3rHiCnzN5UUdfB7zygwHWok8QL5S9uandcvKOFEzLNk8ROrQ4Jd5WtP4iHycAMj5Ga6f3y0WrHBwWGysTXnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 18:41:52 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 18:41:52 +0000
Content-Type: multipart/alternative;
 boundary="------------YJDCPm4mbcQbp3CaqGqjTZsw"
Message-ID: <a3be70ca-fe5d-431b-9046-eacaf74212ca@windriver.com>
Date: Tue, 23 Jul 2024 14:41:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: kweihmann@outlook.com, openembedded-core@lists.openembedded.org,
        Jiaying.Song.CN@windriver.com
References: <20240719164639.GN17572@denix.org>
 <15389.1721741918254132393@lists.openembedded.org>
 <878fe028-ade0-4646-8294-429eebdaeb14@windriver.com>
 <CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com>
X-ClientProxiedBy: YT4PR01CA0442.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::24) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: ef936af7-36a4-474a-72d3-08dcab471e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UEdxQjl1aTh4YlgzeDBoeUk5Mk9EVWpPQkp0N01QcW5GTm0wN1NSMEZka0ht?=
 =?utf-8?B?cHdYUndBOHhKTDYydyt6dEhndnVLcU4yL3FiYy9LNWZmRnRJQ1p1bUZ1TnpK?=
 =?utf-8?B?b1lQVDk0M0NhOVl2VFlCV0RyRnlFYndDOFpFWnlFSEdzRzlsNURIQjJIQTV3?=
 =?utf-8?B?MDEyYVJadTR4NDE3a1I5ekd2ekQ1eVJ1Ry8vb2x0TGxaL3BHa2pEZ0NFdVZU?=
 =?utf-8?B?YlUwRlNOVDZrcThmSHdnclAyVXF1ZFdrUXBuOGVJY1dhMzBPMkFqcmlJS2Ny?=
 =?utf-8?B?TmdNNVNFWW5uS2Znbm8vTDFDblRjZ1Iyb1k0bjNYTW5QenhycTVBSFFTQWdr?=
 =?utf-8?B?MDlCaURudnJ5S016ZlRzb1ZMdlp1a2ROaUNLNGtyRGZWcDBCSDZFZ3VoWVBx?=
 =?utf-8?B?bm92ekQxbGpoVW1vdFJYSzc3VTYrbmFnWDBiSUVXT1pCb044cmF1MXJkTmVm?=
 =?utf-8?B?TWRITk1ySk84Y0lHRzc4d09US3RNcmdLRU1xKzRLajFnbUczMDczTUJBYjIw?=
 =?utf-8?B?ayt1bGVkK1V3NDAza09oY2dwaUg5cHRDVWF0Qzl3VHYvdDk4VE0wOFQyTDR6?=
 =?utf-8?B?YU1RSFZRdkNJT0ZKbE5IeDBpR0MvQ3lzdTZvOGZMYnltZkU2Q3F0eWxUM0ho?=
 =?utf-8?B?cW5OY0hWL2YzN0o3TDJ1Q09mY1VlNWt0Y09veEgvdGdFR1A3VDF6Z2lJMTN1?=
 =?utf-8?B?dU0vQzEwdFh2S0dHMkFJQTBSQ016eUhoMTRpWTRLMXRubG9JTHZDVWxNQ1Z1?=
 =?utf-8?B?eTRQNHpUd3k1QlBad3M4T2x4MXNkR0R2UGd3YzFxanpFM0dXM1ZhZzVDd0tG?=
 =?utf-8?B?QzJ1QmZUeWhETGt1Uk1JdngzUGdwblhaTHhSSzBnQkVYd09KVE1HSmw2UE55?=
 =?utf-8?B?NW9KdjFiUGNHNmoyS2dndDNBSXl5eDcvdHhGVUUwdkRNOHVXM1RQSDNVakdG?=
 =?utf-8?B?SDlWekpFeGVBN29TNmUwVy9wRWNxL1p5YUxGazYzSEhVZjM0SGhuNko3YlhM?=
 =?utf-8?B?R21jV1ZvVFlhN1FuMGErMzlHUXAyRUFzNHBZVmdzYXhlUHpxeVd4T2x2cDl1?=
 =?utf-8?B?TlJUSHRrNW1FeXNFUnlmRG90VWdpSTNPQXlYU0Z5ejJEVytIMFBVaTE1anpG?=
 =?utf-8?B?RklsRTdVaTc5Ulo0S25UUDV1ZEdLWldXUkZJOEQ2NVd6VkVZNXBDNzl5Tml6?=
 =?utf-8?B?Q1pNSGd5MzZUYnRad2h6YWZKa0lyMWRGMTVzN3lQUStLcFB1UDV3V0FVVitV?=
 =?utf-8?B?eVg4OXl3bXVjSSsrL1RIUDEvU1pneDhxZjIyeWpFYzBIQ3FobytzZjd6cFNH?=
 =?utf-8?B?Z2tycTJVY1k1dEpQM0ZLUkg1c2p5MlltZTl4WWdLUXBOcGxNeEFldnIxUGk1?=
 =?utf-8?B?VWJVUjVnKytiSW5aN3N2VjJLdWNydDljZlNCZXRoVlpwRERaV0hJWTVvWjFS?=
 =?utf-8?B?dExZYnhxb1dLTC91Z2NkZW02S0JjbjlzZnpGdk5xZjYzOUU5WE02SW16WTFF?=
 =?utf-8?B?a2thd3hYN25sMzJmTWpwWHY1bHc1SFc0YXpQcXlvYkt5YmsvajN4OXdqb3cr?=
 =?utf-8?B?WDdtODlFZVhtUE1VNFNtazlNMGpoYTd0Q1NYUEJJY0U3dkZpaThKQU9rVnVS?=
 =?utf-8?B?QUhvdGtQQzdXMWFoSDI0UnhUVEhiU2V6OUh5SHJwRzB0UVdtNEtKMG1TWnFr?=
 =?utf-8?B?VkpkQ21VU0hxVHY2T0J6UHEvYUYybFh2R1owZDlvVEVrRjFjekN6M08wYWxS?=
 =?utf-8?B?TmJ3YmlJd2Z3cjFqNzh3QmxzcE9pV1RQMWdKZGNYZUZrdXBCdndjdnhzV3dt?=
 =?utf-8?B?UHRJUlRjMC9PR1p0TVEyUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHBUTHZibE9lQzlCSGRTTk1Dd2NPSklRc3lQTFN3azhVNGIrekZxei9vNGNB?=
 =?utf-8?B?Vy8xUjdtckNkKzZZQnIzTm1yQnpFb2J4K3REQXBjanAyM0Z3WWdlZnQ4QjFX?=
 =?utf-8?B?TzYwVEtBOWl5L1ExUldnYjZ4Y1VkM2FOSURKVDZjUGhLM2EzQUkwRmZaSmxI?=
 =?utf-8?B?ZVUzUmUxejBQZmQydXowUGZuN0NGM1ZQY2JFYS9tR0tuWlZMK0t5cWtnclBW?=
 =?utf-8?B?d0tsUmlRNU1vdml6VG5zSTJqZG1zelU4WTh1K0tNdnBBcncwMjhoSE5OUVJW?=
 =?utf-8?B?Ly85aHR3OXVJTzdQWU1MTHR6Wm4xOFAvYndOSlkxU0grSVZSa0dhNXJRWTky?=
 =?utf-8?B?dkduUHgxcTRFUlIxdGxPcThqM0VBZkJRSDJJM3VCbzVPcWJRazVPd0x3VjJr?=
 =?utf-8?B?a1FjS0hpemgvMnpocHdxRFJmUUxDZVBKbnJ5SmYvSXQ2R2h2SmNFajdTRkQ0?=
 =?utf-8?B?eU82MElERGduVEpzRjVzRnRIL1VYcmI1NW5Md3R1Q0h0dmZ0MzhLeWdIUVky?=
 =?utf-8?B?bjRYUDdWdWpGRWRodFgzNFZmSy9DM1BsYTNCTFpOZEFKK2FMWEJPTHJmdW9h?=
 =?utf-8?B?RWFIYXc2cTZrSGZvZHBzdnNQVVhCR3gydldLeHdQV3MydXhkRnpvcmpFTGJ3?=
 =?utf-8?B?V3NsQVgxMzdraGhGTEJOcFJFYVZZcFJidnovTUlXMjBXTjA0dHdXNDdIS292?=
 =?utf-8?B?MEMxNnFLdEVWWFV2OEZOdmJEbzJJNmJIYkt1VTNGeW4rL21KejMxQ0dHVkRj?=
 =?utf-8?B?RHZCMm1JVTAxRGtiT2hpODBQcjBlUmFSZThMNEhya0paMlgvaFIzTVplajEx?=
 =?utf-8?B?dk1jazhNWUk3TEZydjZrUVZUaUtpa3BHT3VkVEtRK3NUNGY5YVhZazIxVWs4?=
 =?utf-8?B?ZVpHT2wraE04N0RkN2xZZXRDNnl1RVdRamNySW1FMElCeUdqRE15anN6YVg4?=
 =?utf-8?B?ZTIyYjdIb0tsQWkxbkQ2NzlvTUFSRjZhZEd6VExYNkZpU1ZFaXN4dW9DTWU1?=
 =?utf-8?B?UUFBZHUvV3U0Zk1odENJblE1ZWI0VlQyN21STGo2bmZaN05iQUNsMWl6NVU5?=
 =?utf-8?B?empvSlJFWFNrV2ZBc3lTY0dPTXl4ZHRQb3Ruc3FsK0dOTjVlQjhVS050UE80?=
 =?utf-8?B?QjJDTUJaSFRINDR3ZUtBQUppdFZmRXZGZ0daN0dydWZ6bStoUGFCbVlPdElS?=
 =?utf-8?B?WUI1WDl2c1c0QkJjVzVoZ1gyNGhNMmFtU2hWNUZlc1djNDZVSi9GN3lsaVZo?=
 =?utf-8?B?N3dDdnpiUlVvdzk3K2dlUFJlL2JGVkFhZ1NSSHk1L1JvNUZZRzVWOGFRTkpH?=
 =?utf-8?B?dWJNd29SVXdhV2lzS0xRNjI5T0lyLy95Z3JvcFN5bWFlQ1dSQ1FVMjYreEVz?=
 =?utf-8?B?VTZsbEw1am4xM0VMbU83c3A2ZHlvNlhGRG5rc2pPUWNmV3huWThuMGR3MC9L?=
 =?utf-8?B?R1pocTg0aXVscFo3VjRKRXdGQ0ZCMjJpaU9xV285Sk5iYTBRSTYyT0NwbjR0?=
 =?utf-8?B?SHNEajdnVnR1bW9tZERxWHpYOE9FOGFvREFGTUp2bmx3ckdZUmFXbkJOQlRU?=
 =?utf-8?B?T3RRNXFEMWNPc1dSQXpzaHZzWDZvTkJVenA3VTc4bVJscDRqeFJFRElTOE1h?=
 =?utf-8?B?U1JmSExsa1R4N0xGRm1OVVJWZi9VN1NUNHNEaWhSc0FQbkFVSjA5M2xYa0Fn?=
 =?utf-8?B?MGZJNmRIMVpmU21tWDN0SUpEMGp0V0t1ZTFVWGpPbFFjYTdQWDczeEpsQ1Uw?=
 =?utf-8?B?MGZuOFdDU0Y2RkZxYjJadWdpb0JNTWhheUFiRkd2L0NJaFNJdlVYdWgxMzdE?=
 =?utf-8?B?R3RHVnJWWVQ5U0FnQktJTExJU3MrMGNmcitYWmVKL0hwV0dTTG1FQWR5T2Rn?=
 =?utf-8?B?LzMrMSt1RjNpRFdmR2l6OTArM1dJUlpQQ2pWSjVHN1E0QlVqeTlhQVk0L2xH?=
 =?utf-8?B?ai9zUHlPZFJ0bmhNbW93WVdUNlhmNG95alVJSWNQeVNSc0ZDU3F5UkRnOExY?=
 =?utf-8?B?dnIvUUhxOEhiUFd3VzJxV3dhV2RWZncza2tYdzlLd3U4RXNKanhIL2szcU5r?=
 =?utf-8?B?aTY3Q0hWS3J0QkNGZW45bEp0dGczMHk1OWR0VUYvQnh5U29idkMybTkvSUJt?=
 =?utf-8?B?Tkl3OVB1a0svK1BhVk4yYWxzSFBqMjc4Ykk0c2J5U0QyNG9nZ3BvVkVCTmZ2?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef936af7-36a4-474a-72d3-08dcab471e4d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:41:52.0366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2atbBmXoXLXXe1co+BwP4C/2Z9xm/hfEAk/1ojkuU70vbgUbE9G4NoW1HcVDrPVfewxhnhBpSJEVxmclEmnq16AS/QCgILA40KHEQa90t+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-Proofpoint-ORIG-GUID: -tDX95pbRqBgxebbzLrQLTy_-qyskxLt
X-Proofpoint-GUID: gbta6BhelF1aVC1jJOfAJoTjzy3N6fq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_09,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=843 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407230129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 18:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202418

--------------YJDCPm4mbcQbp3CaqGqjTZsw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-23 1:56 p.m., Alexander Kanavin wrote:
> - if anyone is still using python 2.x in target images in 2024 with
> yocto master (nevermind that the public python2 layer is dead and
> unmaintained), and is relying on python 2.x being symlinked to python,
No one that I know if is doing this.
> they should be adjusting their scripts to point to python2 instead.
Yes, this is what I was recommending or at least what I was intending to 
recommend.

-- 
# Randy MacLeod
# Wind River Linux

--------------YJDCPm4mbcQbp3CaqGqjTZsw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-07-23 1:56 p.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com">
      <pre>- if anyone is still using python 2.x in target images in 2024 with
yocto master (nevermind that the public python2 layer is dead and
unmaintained), and is relying on python 2.x being symlinked to python,</pre>
    </blockquote>
    No one that I know if is doing this.<br>
    <blockquote type="cite" cite="mid:CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com">
      <pre>
they should be adjusting their scripts to point to python2 instead.</pre>
    </blockquote>
    Yes, this is what I was recommending or at least what I was
    intending to recommend.<br>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------YJDCPm4mbcQbp3CaqGqjTZsw--

