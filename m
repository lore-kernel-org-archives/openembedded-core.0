Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7970CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 09:43:23 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.web10.7339.1761039801851494549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 02:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=S4JRpSvj;
 spf=pass (domain: cherry.de, ip: 52.101.83.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyidkSXwj4Bf3wRuHP3fbx7vth4Is4+xzRaN2hDA8Y3yomsw8CzX0V/Qjma+hBsmZDlKv35gfqPC8cCs8v0dCW64BOfvUC61hr6QdRRRIx1wW1olQ4u9N1LvffPFZCeFQGKxU+mcdDh9MfHRpk4Y3DJHI1yK4MNYEsH9YjyTRMzh4y8Ns+RANviczX+ai4ak9CY5l8GCnxxNtAeP7wDMTXqxdaU56myS9bMESDZxXfC2UPy9Wl4eQAXmaraE1ckK09L6e3MAOk8Dod0fG7sld5mySbRCMwjkOgHLGL9HezHqA9/h1iJxGUrlP38p0Iz/JWLBr/4dMQC0S2kR2/B1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aUndza2NXje8utys1nf5t/Ax1VgVQLHOvs+yr4t5TA=;
 b=y88SE4q3iKlBzVot/KYOdCNSHjBlvB73rkr33rEl+PcSg6gopCimekqrlBEWYHAyC28ohu3lxR22Wf0UZroXpuhWcXzGSBVfBdriwi/3203FWfZGwjbk2SkgQFgDjC+ammMc6kbAcrqD/kpU2Yjohmrbv7wVSJL834TZV7h3f8Dxhn5I+CYZsJXvzpYKEcZZIfHhTTQjYcXhfVdiamK5q06mjRfYv2ZnIqOYwBT56lwzkmHUTzn6GKvwsoyK8hqADQgH4G0cTLtp2H7Zb9UDMDIJx2XESE2QKcXVyjZDpO8HMFGm5HSI+OzqRaSbPAgpxz3S8LFk9Zgt3hdVXtXOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aUndza2NXje8utys1nf5t/Ax1VgVQLHOvs+yr4t5TA=;
 b=S4JRpSvjQOwNfce9PG4V6gb9oGrReP3OzuvrV68520GYMS0by4BJLwL7DieUMkEOoZcq+E/si/e1xTusHmoCHqFaQHtpqpFA7iSykWkTsklmmCcAe1ElFagDj5ZPByQB80bkw2AhvTXNIb35BhC6u/QLyZ+SOBF0E3/sAqDWl9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 09:43:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 09:43:17 +0000
Message-ID: <968c2772-4289-44ab-ade0-c11cd52cb832@cherry.de>
Date: Tue, 21 Oct 2025 11:43:16 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW09FLWNvcmVdW1BBVENIIDEvMl0ga2VhOiBmaXgg?=
 =?UTF-8?Q?EXTRA=5FOE_config_to_EXTRA=5FOEMESON?=
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
 <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
 <4ded0bd1-425a-4434-955b-c8ce480a01bd@cherry.de>
 <OSRPR01MB1159720651684F40F7339218E9BF2A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <OSRPR01MB1159720651684F40F7339218E9BF2A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a546b00-b5ac-4f91-a41f-08de10864327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SzB2RWpUTDB4dzJEMHRkVHQ3NTY2RHVxMHRsZjN6VEZwQVNQcFVZdmRmdHBm?=
 =?utf-8?B?QzdsQUdKMGdxVkpzK2NpVmFJbEYvb3R3eXhNUmExT3BrUlJQK2pFUE5ESTl2?=
 =?utf-8?B?OHpKS1cvejJlS0ZhRVBjUzA5MVRKVHJJZGdpZ0dUWW44MVJCYmJncDRvS2dK?=
 =?utf-8?B?UDZHTmxCc2c4YWJmdm5pRW5mVHRNWTNuSVVHVG1ObmZSVFpoME85M2J4ZEtY?=
 =?utf-8?B?UlVZSzZ2OFRBWmFrMksvMXk5enYvdjlJUmxMbTlGc2w3NlVzTFg5VGlqRFJw?=
 =?utf-8?B?b2lacUx2RXo2RzFObjMxWUxnVEVMZktqQy9aMGx3MFBFeVdHazNqYWRlOGZI?=
 =?utf-8?B?bWZCRDVZSXJlZFdZZHV6Z09YWmFHd2k3Rys0R3hYVjY5TU9LWDBrdUFEWGxn?=
 =?utf-8?B?dE5wMG1DcVQ4R3RsNy9VbzN6QzVUTGRzaVJOcCtPaWtKS2RSK1FSL3FyaUxQ?=
 =?utf-8?B?enUyWjJ5UVgvUkV4M1NGelRXdkdjSDZHc0M2MDVpaWFaaFFUZTI2dElXTEti?=
 =?utf-8?B?Z0k2Z3dFMkoyMnBtYkNxaVowQTZ5TStoSjh3eE1tZ2dqeEVOQjJWNkY4S3I4?=
 =?utf-8?B?MUxpcUtDUzlkSXpudTVLaFdLbG1YQ0dWNEFKdStDMDlTQTdNbXZaR2dBa2RV?=
 =?utf-8?B?bGJRalU4dHRyTlBVWkgrK0ZqZC82cjQ2aUVmTklRR0ltL3grb204aG1BWGJF?=
 =?utf-8?B?c2drTU9SOUZrRTVpbjAwbERkSEJkVUVmVmpZaUZ5UVo4WEN0NnEwTXZxZjV6?=
 =?utf-8?B?SXdXNmRIUnFnWkJwNUlnTW9YQlhteEI1S1hlRERSSTBFdmM4czRXdkRvTVJW?=
 =?utf-8?B?QnhPVUxBemJuUXBncmJTSjZUeDlUMzc4QndZckNWek9ST0dLaUt5RTV3WnVv?=
 =?utf-8?B?Sjljbytqckh2ekJiak5oUTZtSHRoVUtaOXZEY0pSbzVLdUFUeTEybFZFc3JD?=
 =?utf-8?B?cEtOZ25VWS9YMW9Gdm5aRUYraXBSUm5OalptZ21uOHNzYTE1U3Z2NGhsaWli?=
 =?utf-8?B?NzBINU8rNnh4d2VFZTcrWUE4Uldab0tvMUQzUHJTL0hXcGQyZ2dKbFZJU1Vm?=
 =?utf-8?B?N0xoSkx4alJzYmVBb05XVVdhdVZlY0pnamFvM0tXeUhpQWpKaXZSYmhaOHBQ?=
 =?utf-8?B?aW02V1RjZDZiVU9iQnJNalNEdjZhWlN4b29BS3kwQVB3TjFtR2lNckhpRUlF?=
 =?utf-8?B?dk5qZE0zZWh4TVBZd2RRdVFGZzZhWDRyVU1EcGlIMkdNaGIwb0Z5MkR1ekgx?=
 =?utf-8?B?RFFYcVNlSk11QkNYS3daSE9LbXJRQWpscHBZYUZuT0s0NDN3b3FTUmxReDdr?=
 =?utf-8?B?b2xNVGlNR0YyMUMrazVhVmRlbXladXZiWmVGN1pYR25UTm1kYVNlbTBHMkdJ?=
 =?utf-8?B?a0VDayt0M2h3NDZmWDVjaGJBTEpOMUIveGw5VUpTU0Q3dFh6YnpYMjhucmt5?=
 =?utf-8?B?bjF6Q0FCZnNNcDdXbzFIeTVJYlRpNGExdEFvbHZ5SlBHYVp1MHhPRndJbWgr?=
 =?utf-8?B?N1I5Ykg0TUpvYmpZVjFkaWlWL3FGMDNqWVVURDQxSktrRE4reXZhbWl5M1pR?=
 =?utf-8?B?TUI3ODBhYnk5RFcvS1lVREFOVlFDR0Yvdkt6dDJ1aHY5MWVWRnZKZy9uWjhi?=
 =?utf-8?B?MkZ4YTcwV2hBMFNsVmd6bjhZTUhJSFpUcll6dlZTYnl3dDB5RFBMTk1lcjB0?=
 =?utf-8?B?Vnc4NWkyM2JsU1d1VjJFbDlwOENuakxGUERrTHdzS3RPLzlMWU9YZGx4eFN5?=
 =?utf-8?B?MkRSdlRpNXlzUE9ldEpUWjF2MitYRUliWE5mNERaMld1d2FlWGdLaGZoS2Rx?=
 =?utf-8?B?UVN5dzNsM3FmcTcrMVRlaTBKZndGQjNPYnlTTEdzM0l1dmFMVVZXL0tKQVpt?=
 =?utf-8?B?b2JDNmp3M3FyNkF6aGNiMVc3c0U3c3ZUd3pUeVBURUEyNGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NU84ZU1TbEg4SnNzMyszeUZXVHVVZmlaNGVSOGovbTJlcHI5dW9qSEp0TTdC?=
 =?utf-8?B?eTBsQXdsa2VmSHF2aUJmRzhVODZDZlJOM0QxVlV4eVV0R1JHdzlzYXVwZUpV?=
 =?utf-8?B?bnZaN0duMUFPZ3h0TVVPdGhrc1B4SnlZT1gwR0srL2lNYUpmckVPRG54cnFU?=
 =?utf-8?B?ejNwcDVtQmJLbUZ5eWFHSGxHOTV0VnVzVTNCQWo2b0MyWFRxb2Y4dkg0V043?=
 =?utf-8?B?N1BIM3g3NG9iNWhNMHRWelliQ2V5QkdFNzJ0dGVUWGRTLzVJMm5MK2piSDRk?=
 =?utf-8?B?U0UwbXF1aktJbnBxeDlhb005OHJ5TUlMZ1BnMGdBN1hEaUlRUTVKdmR6aUpi?=
 =?utf-8?B?TU9BYjRTU0dWZVJrSVlWQWhySWpsbGFDbEZSeHgzUmF4dVI4Vy92MHFqKzRI?=
 =?utf-8?B?Y2hLTG8xTzVHM1kreHpKa1hXT3ltQnozblZ3T2ZtNmo1Q29tYmFDVGtXNjdo?=
 =?utf-8?B?S25xazZ3bW9WWWl6eWRUR1dZV0N3RFZBZDhkNGJrTDV4WkdxQU56MDlnYWlu?=
 =?utf-8?B?TW43T1RQbmFmb2FUclk2NC9wdTdrV1pWbTlTYmhQQ0U2ek1mRzVYMWFYazlr?=
 =?utf-8?B?RldBSmliUEJDMkFwYmpYdDRiUE9KT3FBTWszNmtocVRKcEdIUHRZYTczNks5?=
 =?utf-8?B?ZzkrcjZPSWdpTy9QL3BlRTM2WjU5VGQyd2VnMW5rOE5zY0pxdTBvMU03SnBu?=
 =?utf-8?B?RThjdFdTZ3pZZmVFUmtHelR1cXZqSmNqRGJmblhpYkxDd2pzd2IxNTZQL1Bi?=
 =?utf-8?B?NktjcHpnQkVpcXRjYWJvcEY2WWRpUFY0OXJaQUV5eitjVk9hSFhIODZXR2VJ?=
 =?utf-8?B?NjF2cDB4VDNUREM3dzgreHVVSHF4b080UHluSGk2aFI0K2F1aFZGU3cxUDk4?=
 =?utf-8?B?WFFWQUVqQXV2Vm1FOGI0RUQzM3dnWVZJSnBKcHBMQmVuZkt2eVVTVXc3RURh?=
 =?utf-8?B?cm9OQmtGUDJOaVlQamxjckpqQUpFblpUNEhmNlNxeEQyZzQ2b0U1Q2kwODl1?=
 =?utf-8?B?OWwza0tVajlOb2JCUmhEQzN1eE5BTXQxSCtYR0RCcVU1QzlyblVuSzBjR0dT?=
 =?utf-8?B?NEgrdVZhOVJmVVNudlBZTHRTVHk5Zk0zMXFyZnlkdlNBTFhxeXcrMjNqdTA5?=
 =?utf-8?B?bWV4NzBLOHhkTE9EU1o1TXBIZXhodDN0UnJNU1FNeUZzbDM3S1VDR1lIMzVU?=
 =?utf-8?B?MEpVRm9RSGhoajF6Q3hqV3lJeWdtVTVab1RBVmNkY2dLaDdvODFZb3hMYXJm?=
 =?utf-8?B?UDAwemp0UGdpeFlTdXVHcXpMTjB4RFM5RjBwZjN5M05SWStoNVEzeWl0Nm5I?=
 =?utf-8?B?OVkxcGdrOEZ2clBROS9JQlJQYjZYLzFPQ28vVkh5aEJDbHgyTGlVblM4eFB2?=
 =?utf-8?B?Sjl2VFJqa1diZVc0N3RHNmJPQldIYmxIS1RJVHVPZG5uQm9ueEVlZExzbVpH?=
 =?utf-8?B?RW1haXozeVdGYXNjNG54R3RvWEhvekdHcGpiTHlocUJ2aE9oUlA4SmJwbmZL?=
 =?utf-8?B?RC9URk9DZ1VaY0crYVczUTJSejFQaVA0aTV1bmMybk9iN29VTXgzd1NaMWIz?=
 =?utf-8?B?S0g4aU52M3dZeFVoa21PWWlsdDliWG1LYjJQL0x0bHRYMEd4QU9Uc28zMzZC?=
 =?utf-8?B?M2tjQjJXWnlFTTE1MDNJOHB3R2pWUFZxbFdaSmltelpGMGR6Q0FrK2twYXY2?=
 =?utf-8?B?NEpTVW4vcDNMeXNlY0dqN1pBdTdCa2o1QzUyUjhJSXlIOE82NkJlVk1FOUxZ?=
 =?utf-8?B?M2RWazd2SWkwVCt5KyticXREdE5xN0dhT2NKekkyaHBFZ3FTVlErbkdQMDJI?=
 =?utf-8?B?R0dOZm1kbmdSZyt5U1F6QUNQeDNSdnk3dkgvTlJhMC9tRGZabnlDMmNZWjlx?=
 =?utf-8?B?bTlETG00WEdBTXFEVmp0a0RpN2RvbmJubEpuVVY0ZzRVWGdweXlyUGVidXRu?=
 =?utf-8?B?c2xndWpWU2pNYU1lZ2RkM21lUEp5TWRFUVY4RWQvMlQ5U01pY1k2R01kb0tm?=
 =?utf-8?B?U0ZLaUFRZnRLOFExWnZDL0t6VENIY3FlQ1czb0JKVGdBU1BiUTBEcHFkNGR4?=
 =?utf-8?B?MjZVc1I0T0hzSGZTa1NDRlpLcVE0UWFLbFNFekxJc2ZOdnp3Ui9MS0dhZ1lu?=
 =?utf-8?B?VkhsWmdueDBGMk8zeFhNeDIzVzNsbHp5NTBkV1lwemx0d2txeDVaZVIxQ3RK?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a546b00-b5ac-4f91-a41f-08de10864327
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 09:43:17.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXZ6fco1e2Y+9mi0gkXLXTUroBJh/7yHZOOAR69AsF7pYCfbFFXz8NQ19KTuOhrUMnLeJeHTcgGJa49Ep1x/J7+FtlMjLyBfpzhciJml5i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 09:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225146

Hi Yiding Liu,

On 10/21/25 8:46 AM, Yiding Liu (Fujitsu) wrote:
> Hi Cheers
>      When I changed to EXTRA_OEMESON, -Drunstatedir=${runtimedir} will be enabled,
> and  it will produce /run directory which will cause do_package QA Error as follows:
> ERROR: kea-3.0.1-r0 do_package: QA Issue: kea: Files/directories were installed but not shipped in any package:
>    /run
>    /run/kea
> 
> So I remove ${runtimedir} before do_package.
> 

runstatedir is "The directory for installing data files which the 
programs modify while they run". Looking quickly in the source code, it 
seems this is used mainly for control sockets or PID files. Which is 
confirmed by 
https://www.gnu.org/prep/standards/html_node/Directory-Variables.html 
which is pointing at by 
https://github.com/isc-projects/kea/blob/master/ChangeLog#L211-L217.

kea's meson explicitly generates an empty directory for this path, 
hinting that this is necessary for the programs to function correctly.

We have another recipe removing runtimedir which is dbus and it's 
removed because "Remove /run as it is created on startup".

Does kea work properly if the directory pointed at by runtimedir doesn't 
exist? (Note that kea's meson creates a subdirectory named "kea" in the 
runtimedir directory). 
https://kea.readthedocs.io/en/latest/arm/security.html#securing-kea-administrative-access 
seems to indicate that CONTROL_SOCKET_DIR/KEA_CONTROL_SOCKET_DIR is used 
for the control channel which is disabled by default but notes "however, 
many configuration examples have it enabled, as it is a very popular 
feature.". SO I'm wondering if we should not rather *add* runtimedir to 
the package if it's actually necessary?

Cheers,
Quentin

