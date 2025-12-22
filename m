Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39257E674AF
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 13:31:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80002.1766410264278265392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 05:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PSyFxtKv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451f72a3f=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM6x8uk771540
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 05:31:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FYhrEBHMF4C/eDXM3TirSqu9CnwlvBs3gcXgIS/9w8I=; b=
	PSyFxtKvhWw9vU4u9Me4FUCFkoWszyRtNzOHcufJj1N/ijMm2WMNeucmUzDuVO05
	HT1UuNI7OgQfQVvarkyj+MC1oCS9hdO7CedjU8nF5nmkgfo+nsvNO5zxYYl1wuXJ
	3gNL4EEu+8vOQ91QCAf13BjWnXwfHoMS4LLMQSrsb5544yBcRSFhzWWk0a3evb7a
	xhBqEd7r3O6+ootM7AP16b4F1aVikQvc1z2oEy+BycIyGTwMitkXrmxQjchWaVDw
	CWXJuGOgow49IQZgUNPwhfFqZWVhPHmzAekBlrQA9pB9WdxRy2pUCxP2qCq8fu3M
	leW1a1ADXAEnvQfQs5zLLg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6h9f5q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgZdP4bj0tSKjRiMyVpp0pJdNIvWm9EBXTwNLO9bjSzGmQdUJJkBL6hnBFDEg2YuhrQ3Iwh6bJMxzcpTvEGA4iSgEH8cqDaWVPSIPIEGi71zCz3s9/BtTEW6kcj6r/Hhg6xE1IaJQlQUbs/hCUHAnhCCxP3gRMUFpH2wMbkPhL5H5EfuP+90fGBnYtwPhjUdEwbVNViIDJWftkSaNqDW9mmv/OavHF7sDo+pn809RZ6SoEzMFY6iTS8fcPlKVDddlf9CH8XklMRQ8teN7d3oYRwS1s04XWn2angNh+Vx075QMURRTY4rxrXbhBwoyPd4BlmVZab0AdxhP00xDPXlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYhrEBHMF4C/eDXM3TirSqu9CnwlvBs3gcXgIS/9w8I=;
 b=FHIOof+CRigWfyyAOpmAUU58yssr6SR4Vc2SjfZljG/HJvKq4UuopuKg37FC02Dt7pUIXEUjpsBZKmyfx86fJz44QxLpBYHreboj6hzY/wyxv1d1H1mnOW6AbwSKy3oQp7ECfoBFkiYmzsY5bCXnh/QddfsOFB/XHH3KPLbHWGduwjlNO5Se22VE9woDofWWggHscFOSLLeiIfQh8ayd/Kf2hPEW3Bbit7aCAFxKXZZ9trsfsy9GIF651agu8kmr56RlKEuG/myMrA3guhKli8iKgTK07GTBMaURw151bvYOgsAP5R/QHRWO8sYjVS6C3XuK+HZJeMVmp0cwd5RvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 13:31:01 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 13:31:00 +0000
Message-ID: <972da87f-8486-4931-95a7-44840f0b6ba9@windriver.com>
Date: Mon, 22 Dec 2025 19:00:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] gdb: Upgrade 17.1
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, raj.khem@gmail.com
References: <20251222042123.315327-1-sundeep.kokkonda@windriver.com>
 <CANNYZj_s3=QssJ6aXgV7_KR4hstKNaz3QbacPTRHCHFCGq6JBg@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj_s3=QssJ6aXgV7_KR4hstKNaz3QbacPTRHCHFCGq6JBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: a83d8834-cd9c-47fd-00f9-08de415e58bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TlJ6eUlmdmQ1dkFCc08wQUljWUVuYk1sNFk1alVBQldNWHIvRko1MCtEOGly?=
 =?utf-8?B?eU5yaG5FUlpoa01MaXRudWtsZllZdFJmSS9PMG9LN1lwc0p6YzRUWGRlRkpX?=
 =?utf-8?B?eUppSGdGemdmOXF4bFR0TTB5TEoxTG41UytCcmdmc2Z6RHp0emM5WlhFVm4w?=
 =?utf-8?B?MHBGRDVDWC9qeXZaZHlXUnNBeGFzOGVreE1yNFpXdzEydWkySzZnZnAxTkNF?=
 =?utf-8?B?UnRPRzNGcHlJQWs0SVpHTW0zREFkNVJTYUo1eGFtaU5PYkRpRVAxcmhiNGJy?=
 =?utf-8?B?bDdJaG90cjA1SVUzL3V3NG5mSXg3RFY1SExqOTFDbTg1Q0ZjM3QvVVlJa3l0?=
 =?utf-8?B?bHdpU2JwZjFveVFxT3lDdnYvK3FNZ05YMU5KNFl4R3JGUm1RbEY2V3E3Ykwy?=
 =?utf-8?B?elRjY29kSklvZTVSakhqd0QzMzRpUU1GTktybWJScitRcGlhTmpjclFMcTZk?=
 =?utf-8?B?Ni9lQ20wSEpDLys0Y3FUUk9nWDRhbVczdis2YzFJSk5HRFUwaE5IZ3plR2NN?=
 =?utf-8?B?TEVMSnVmRXRnOVRKNkJ3UXk4eStuU2JVb0M0bFhwSVFjRmVERmgrVVRFdE1Y?=
 =?utf-8?B?a01GUG9BdFlZMGZaN09QeHRCV2h5YUwzQUlpRFFVcHBBdlhhSFQvT0NFMnBJ?=
 =?utf-8?B?allndDhqbjdWZHNQdFdoLzlRaEVuRjdkcmFGSXNTbmhCdE5MRVhvaWdqMXJI?=
 =?utf-8?B?UWtNazhBRWlPamlrMWR4M3hJblpudkZqTmFtMVVIcTIwRjY3TGNmTTlOTVc5?=
 =?utf-8?B?ZkxXcHVFaTFicXlacFdpTTYrZEdjcS9NZVpNUXY1V0JqcndwdkVyNnZtNkZM?=
 =?utf-8?B?YkQvSWkvbXAxdEJ2djh6TzUyeDNJd1AxN1lkN2JaNi9yNW9wR0ZHUTFaR2R1?=
 =?utf-8?B?b2hMMm1UMTRzSGZPQk1GTVNQN0xkL1gzSEpFRGNIRmNpaE5kRlFFRFJlOVF6?=
 =?utf-8?B?SXo5aEJ5dXM0bEZlaWhMSTZLeGd6YlVQZ0RnMlkxZXRnRWFRbnZnT2krYXZ6?=
 =?utf-8?B?ZnZxK2J1NFJBRjRHY2l4Q29NR2phanZYU1UrVHZCVEVPUVRqeUlpRytRVVgx?=
 =?utf-8?B?NUdLMkJ4UmNZQ0sybUhZOVlnVDlOeXBiQndCNUlENTZmd1lLK0lxRldhTitU?=
 =?utf-8?B?VWV4OEljL3hWV01POFBPQ1Yyclg1eFRxdnZnZUJtT2dEUWtnWk0vMVJoRjNG?=
 =?utf-8?B?WStiblI3cnBMdHdQRlJyb2RrQUR6Y0xMWWVjRkw2UWZzWXVPeWFpdy9FNHhO?=
 =?utf-8?B?dmlmVVgzTUMva1FOYWcvYnl2cUNLbEp4M3dmVW5YZU1Da0p3Z20yMkpVY3Yy?=
 =?utf-8?B?ay9NSHgzNyswT3pyZXdDRC9NTFBGYzhIU2huNzlTaUdTY3FGbkdQbUNjKzcr?=
 =?utf-8?B?QU9nWk9KeWkzYnlYQ0p4S3QySzZmWC9UdjJ6c240Z2RSS01JVStzUUhoL3Ba?=
 =?utf-8?B?MnM1Rk50VkJxbGg0UW5IZjVVa0kvd0RBWFo3UnFwb0plQ2RBUzhxeUZ3aEVy?=
 =?utf-8?B?TzAxUVVOcTlmdEtFeFRKQ2s1V1lPbWlBbnRQVVd3dWdkTGpGVFFzSjV3RW5R?=
 =?utf-8?B?c1FsdUZRRUJqTm91NnBYekhRT2xPNzZFcEVRRmpRblVYTVpjS0N4MFU4elRH?=
 =?utf-8?B?TEdCOFRRU0xtaXlQNEpNejIvL080OGJ0NUtFUUMrVHFjY1ZHaGFIZ1V4M0Fi?=
 =?utf-8?B?d1Z5REFTVm5TeGY0QnlrNjZiYXpFOUlpeStQVTl6Z1hBUW84aXNzZ2pLR2kv?=
 =?utf-8?B?ZmpySWpndDh1NTNsSThPaXVLTUh3U2tLNURHYXE0WWxOQTBVZU9aUDRkUkJs?=
 =?utf-8?B?Mm5IWWJpaElTVGhGbWRYYjUwaERkdi9veS9lQUwyUDNZcjhENmQ5ZTdLaXIx?=
 =?utf-8?B?MDNRTkdkL2FuUldDL21PWVF2a1JjV0I3ZmRQNzVwWWlCd1BsL1J4K1B3ZkU4?=
 =?utf-8?B?OWg1bWdFcGFFK3BYYXFBbHhzOWg3STVpQ3BPM3BSdS9NeE5TbDljUDYrQmJD?=
 =?utf-8?B?Q2xSWFd4Y2p3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjluWU1DeVNuaXlkU3hnaFdXd3o4NjRVcWdhR1pKc0NTa25WemhzYWRpQU5J?=
 =?utf-8?B?cHdwMnNoYjdvNEJHQlJoWUJCRkZJMmlucVcyR05RRlVmQjlvanorNG1lTTdv?=
 =?utf-8?B?RnoxczhVVXFpQVBRTEFsK1U4QUN3cEhUaGZzM2NTSmZBWFdVSDRyZ1F4YUpT?=
 =?utf-8?B?RHFSY1V2Ui9xNER5OE9oaUs4OXhadzM2aDdqOWJ6azFESGk0VkhaTWtvTm1V?=
 =?utf-8?B?ZUpIT0dSV1AzTGhhTDRTUW15SWk0N1RuRFZvN0tuY2VjaDRpUFc0SEloakI4?=
 =?utf-8?B?SGNTc0tHVndBaVdHMHVrUmRuMEEyd0RhMFh4UlgrbGpwLzVzV25KUmVSMS9E?=
 =?utf-8?B?TU9OWFJDaTFuN2JLVUpnYkhUai8zMjVobVJjeHVvU21HZ1pKRERpc01sSjJM?=
 =?utf-8?B?MlZwaUlKc1E0czlEK1ArTkg0azNGZFFRM0VaMDlVdnVXNEJKcjE1UDM3cTFC?=
 =?utf-8?B?clBsTS9NeEc5ZVZoeFY2ZjV5eVNUZlJMMStrcXh6K0NyN05CckpmbEhGREJr?=
 =?utf-8?B?QWtTOVl6dXFWTFRyQkJZZVNlOGNleXFhcVZsTWo4UjVPbkdiRWkyUkRQUlJP?=
 =?utf-8?B?SlZtckZUUlBUUVZKUUpxQmdvNVJMK0k0eVhzakRaeVdSc2ZvOHZCU3hHMmZH?=
 =?utf-8?B?M1pMWDFPdUFQaWUySEFGUklObTd2OUVuZVhpZ0NKaHU0a3RtWXhGSW1xZmFR?=
 =?utf-8?B?NUFjYlpXOS9QNGJOc0ZycDZ0aytERFdqSFE2MC94UE5xYnduZUJFcEl6eGZq?=
 =?utf-8?B?YVpQUzVpV2xuOEtjTHJnSUxhNkc2anQ0bFVjVEFtY091WkxzWVIzNUxIVWxt?=
 =?utf-8?B?S01RYUJTenJ5VHdPQlBucFJZLzhSalVPeTZ6TXI3ZjNFRDhiZW1WVU9CMHFG?=
 =?utf-8?B?eVdqN01YbXhlcDNDU1hDTUZGdnVuWitoSUtmMjNyZVVCOTFhM3dHQ21RTDht?=
 =?utf-8?B?UzlBdWIxcmpCdXVTQmxTWDRrTGxwVG1tNDZ0WURmMTN1MDFieFg2bjdORXdi?=
 =?utf-8?B?QUZleEpKcGpFS3BEUWZQVlAzRTJPelFPUldjZ01wUDZXYkhMa3RKaTk1NmRE?=
 =?utf-8?B?RE9oZjBZcWtIZXBkYzFQbGhjTFZRKytseGtHTVJKOS9Uc0lCd3MzS2JJTGxC?=
 =?utf-8?B?NlRqSGxoZ0w3RmF5UFhtRk1yWHFiOWhxaERoT0hFUlFWNTNMZVVMMno4MU9I?=
 =?utf-8?B?RnJneGtGdVd1ejJySWdkWEFKa2lVSHR3RFZnTWJWQWI3V25VU2RHS1VGeHZw?=
 =?utf-8?B?Y0R2aTkyemJvS1RCL0IwUlpoTk8xKytkM01QSFUvTGk0ZzArTnhJaHR3cjhB?=
 =?utf-8?B?R2FPbTJOT0plcERGMEJicFhKNXJuNkdRZ0R0Y2ZaekpmbHcvY3NsdGFnUWdl?=
 =?utf-8?B?TisvN055aExiSzlDZm1xUStiQVd5cHl6S1RxOU80cTJudlJNUngvYjJLNS9P?=
 =?utf-8?B?N3B3UnJRVDdDbm54UDdSaW1pVlBTWXF0dEVubERnNkh4eEdEK1hreGZSR25Y?=
 =?utf-8?B?OWtqcmZjeFdTMGVBcW1YNkdVc05INitmVlc2d05HNlVaOUljYjFrdlZFWnJq?=
 =?utf-8?B?VGhUSVA5ZEdvQXVKOG1oejdPaG9xTjZmSERuYzZzVWtoUVFHOG85T3p6NThN?=
 =?utf-8?B?cHU0UGVPTnZrWldqL0MrNnFXV2JvbHRwcHlXQ0M3eUdoVnRlVDgvZVZIVlE5?=
 =?utf-8?B?MUpIc2xMaGJQNzRkYm9sNVN2eGZIckJTWFp6azdmajlhSFhycVA3MnlXZ3ZL?=
 =?utf-8?B?ZmVueU1YRkpWU3laMVZWMFEvYmZ4dm9Ocy9zaS9NQmtQTURFazBuNGRudWZl?=
 =?utf-8?B?UnBoS1FEYnBuclpYVityWmRXcnhtMXl5anFNdnVORGZib2IzQ0dTWWJlUjJH?=
 =?utf-8?B?ZFdSK3ljd0N2Y2I4bmZXMUNvRXlEL2FXbDFaN1JNTjZQYWxkdEo1UElTMXkw?=
 =?utf-8?B?bEdteG9KLzJnQTdldFdLcG53R29ZSndnWG94dlluVWtpZnZwejBJRDdqWDJ6?=
 =?utf-8?B?d2paeGU4ejl0aHFONHRTdlFLR0FjR3RuU25YSy9kNElnRk1rN2FsbTk0ZlFy?=
 =?utf-8?B?RjhuQTZ0Qm9RUWxaS1pLdEhxYmlhR0xyUXpvNWl5Wk9VN05kQmZFWTNrQ1hl?=
 =?utf-8?B?VjRlUEQybXRZWGFYbXZObHFFS09yYm0rdlNFcTB6ZVdDdzJEUmpMbmJ5VTNt?=
 =?utf-8?B?eGEwNWFvbzRzUHZQRUdFR3JiUXVGUm9qY013Y0p3eDhBS212MXFMcHZoSWx0?=
 =?utf-8?B?U3lHaXN1dHllcmNMd1I5bDZmUmVQN1p5bTFBZGdGS3gyMkFVVmIxY1hHNWxW?=
 =?utf-8?B?UGJVYW5IQnp2eTRtSkpjN05yUEl6M213bzduUUR4S2NvYUYrdzh1OGU4YVRl?=
 =?utf-8?Q?Wj+PnvF6SKeFxd4U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83d8834-cd9c-47fd-00f9-08de415e58bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:31:00.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMFi03KxdQDZi0TyzFzBJJP8tYwkwE9XDhqrB/aSQztln6FKuobSRLtAnInY/A3bpjr2f+byryie0x0UG80tDd46tjyhyttyED35DwZ8XAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEyMiBTYWx0ZWRfX6WiBHq833lfb
 2YQqG71lgkxwiUT/Tt6PDkPer2Zklon3qdacDIZNQ26iWB1itromAYbxRDB7tHn8mYoDXiZUljs
 UqDYiuzAp1RK9sXcjK8tQY/pjbPmV5OMrktDoqS7eQ/7nmJGk6S6gfo1+UGX0LtLGtgDRtp8yxA
 UYm6eoTJATxWT4lXMEo06i43lzAN0hZIF6lwwfRTE20u59sp/OY/cTf17iw1SxF0V1ICIJsNXwY
 lEOGhl8E3bo5cFDWPU85za2Mr2qA3fWbbcPHs000o3NqMFJOEKepuKMj4m4CpWLfElHRZVsBIr3
 NT3qd+rsHIz+vtPJ7KaIsE2BaRr7wdsXpWIpWet5Gu3eFF1TzePhcW++OkR2yWqtaooR8yDKJv3
 6jaE5/KGZaadWeHLcCjV0n3R9PMIWspcvY6hLkfLEITh/8gL6EEJBxjsrx398/L1fhSuqtn0QJi
 yvEVAbEAV5ksczvLgVg==
X-Proofpoint-GUID: kqRYfBBh1mJHAWSGnHAwZQxhDX7v0PUz
X-Proofpoint-ORIG-GUID: SGCaPd_j6IAJ8evOXVM-k8fFyKZ-Ff8w
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=69494817 cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8
 a=VBORAJJozymVojvBlacA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 13:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228303


On 22-Dec-25 16:38, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 22 Dec 2025 at 05:21, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>> GDB 17.1 includes the following changes and enhancements:
>> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release
> The commit title should follow the convention: "gdb: upgrade 16.3 -> 17.1".

Thanks Alex. I'll send a V2 (It was sent referring to 
https://lists.openembedded.org/g/openembedded-core/message/210628)


Sundeep K.

>
> Alex

